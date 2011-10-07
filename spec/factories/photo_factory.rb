Factory.define :photo do |p|
  p.association :lesson
  p.title "A photo"
  p.caption "Photo caption"
  p.image_file_name "image_file_name"
  p.image_content_type "image/png"
end
