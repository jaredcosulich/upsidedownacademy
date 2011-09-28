class Lesson < ActiveRecord::Base
  belongs_to :user

  scope :recent, order("created_at desc")

  CONFIDENCE_SCORES = [
    ["Just getting started, basically no idea what I'm doing.", 0],
    ["A little experience, I'm kind of figuring it out", 10],
    ["A little confused, I thought I was getting it, but now I'm not so sure.", 20],
    ["Novice, I've got a long way to go, but I'm feeling comfortable.", 50],
    ["Some experience, starting to get the hang of things.", 30],
    ["Feeling frustrated, I should be progressing better right now.", 40],
    ["Solid experience, not an expert, but I know what I'm doing.", 60],
    ["Expert, I know this in and out.. I won't lead you astray.", 70],
    ["Beyond an expert. Experts look up to me.", 80]
  ]

  def full_title
    "#{subject}: #{title}"
  end

  def complete?
    subject.present? && title.present? && body.present? && confidence_score.present?
  end

  def confidence_text
    CONFIDENCE_SCORES.detect { |score_info| score_info[1] == confidence_score }[0]
  end
end
