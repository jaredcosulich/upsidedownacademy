class YouTube

  def self.get_authorization_token
    dev = 'dev' unless Rails.env.production?
    data = "Email=youtube#{dev}@upsidedownacademy.org&Passwd=thud5loop&service=youtube&source=UpsideDownAcademy#{dev.capitalize unless dev.nil?}"
    response = %x{curl --location https://www.google.com/accounts/ClientLogin --data '#{data}' --header 'Content-Type:application/x-www-form-urlencoded'}
    response.split(/\n/).last.gsub("Auth=", "")
  end

  def self.post_video_info(video, lesson_url)
    lesson = video.lesson
    post_body = <<-xml_data
<?xml version="1.0"?>
<entry xmlns="http://www.w3.org/2005/Atom"
xmlns:media="http://search.yahoo.com/mrss/"
xmlns:yt="http://gdata.youtube.com/schemas/2007">
<media:group>
<media:title type="plain">#{safe_title(video.title || lesson.full_title)}</media:title>
<media:description type="plain">
This video is a component of the lesson, "#{safe_title(lesson.full_title)}". The full lesson can be found on UpsideDownAcademy.org - #{lesson_url}.
</media:description>
<media:category
scheme="http://gdata.youtube.com/schemas/2007/categories.cat">Education
</media:category>
<media:keywords>education, #{safe_title(lesson.subject)}, #{safe_title(lesson.specific_subject)}</media:keywords>
</media:group>
</entry>
    xml_data

    url = URI.parse("http://gdata.youtube.com/action/GetUploadToken")
    auth_token = YouTube.get_authorization_token
    req = Net::HTTP::Post.new(url.path, {
      "Authorization" => "GoogleLogin auth=\"#{auth_token}\"",
      "GData-Version" => "2",
      "X-GData-Key" => "key=#{YOUTUBE_DEVELOPER_KEY}",
      "Content-Length" => post_body.length.to_s,
      "Content-Type" => "application/atom+xml; charset=UTF-8"

    })
    req.body = post_body
    response = Net::HTTP.new(url.host, url.port).start {|http| http.request(req) }
    parsed = REXML::Document.new(response.body)
    info = {}
    parsed.elements.first.elements.each do |element|
      info[element.name] = element.text
    end
    info
  end

  def self.safe_title(title)
    title.gsub(/&/, " and ")
  end

  def self.post_video_file

  end

end
