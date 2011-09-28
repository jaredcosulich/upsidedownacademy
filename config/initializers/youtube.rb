class YouTube

  def self.get_authorization_token
    data = 'Email=youtube@upsidedownacademy.org&Passwd=thud5loop&service=youtube&source=UpsideDownAcademy'
    response = %x{curl --location https://www.google.com/accounts/ClientLogin --data '#{data}' --header 'Content-Type:application/x-www-form-urlencoded'}
    response.split(/\n/).last.gsub("Auth=", "")
  end

  def self.post_video_info(lesson, lesson_url)
    post_body = <<-xml_data
<?xml version="1.0"?>
<entry xmlns="http://www.w3.org/2005/Atom"
xmlns:media="http://search.yahoo.com/mrss/"
xmlns:yt="http://gdata.youtube.com/schemas/2007">
<media:group>
<media:title type="plain">Lesson: #{lesson.full_title}</media:title>
<media:description type="plain">
This video is a component of the lesson, "#{lesson.full_title}". The full lesson can be found on UpsideDownAcademy.org - #{lesson_url}.
</media:description>
<media:category
scheme="http://gdata.youtube.com/schemas/2007/categories.cat">Education
</media:category>
<media:keywords>education, #{lesson.subject}</media:keywords>
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

  def self.post_video_file

  end


end
