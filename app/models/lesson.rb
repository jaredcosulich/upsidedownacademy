class Lesson < ActiveRecord::Base
  CONFIDENCE_SCORES = [
    ["Just getting started, basically no idea what I'm doing.", 0],
    ["A little experience, I'm kind of figuring it out", 10],
    ["A little confused, I thought I was getting it, but now I'm not so sure.", 20],
    ["Some experience, starting to get the hang of things.", 30],
    ["Feeling frustrated, I should be progressing better right now.", 40],
    ["Novice, I've got a long way to go, but I'm feeling comfortable.", 50],
    ["Solid experience, not an expert, but I know what I'm doing.", 60],
    ["Expert, I've been doing this for years. I won't lead you astray.", 70],
    ["Experts look up to me. I know this in and out.", 80]
  ]
end
