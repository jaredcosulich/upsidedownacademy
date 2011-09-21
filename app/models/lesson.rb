class Lesson < ActiveRecord::Base

  CONFIDENCE_SCORES = [
    ["Little to no experience, basically no idea what I'm doing.", 0],
    ["Some experience, starting to get the hang of things.", 10],
    ["Solid experience, not an expert, but I know what I'm doing", 20],
    ["Expert, I've been doing this for years", 30]
  ]

end
