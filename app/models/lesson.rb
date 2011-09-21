class Lesson < ActiveRecord::Base

  CONFIDENCE_SCORES = [
    ["Just getting started, basically no idea what I'm doing.", 0],
    ["A little experience, I'm not totally clueless.", 10],
    ["Some experience, starting to get the hang of things.", 20],
    ["Novice, I've got a long way to go, but I'm feeling comfortable.", 30],
    ["Solid experience, not an expert, but I know what I'm doing", 40],
    ["Expert, I've been doing this for years", 50]
  ]

end
