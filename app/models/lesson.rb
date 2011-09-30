class Lesson < ActiveRecord::Base
  belongs_to :user

  scope :recent, order("created_at desc")

  CONFIDENCE_SCORES = [
    ["Just getting started, basically no idea what I'm doing.", 0],
    ["A little experience, I'm kind of figuring it out.", 30],
    ["Novice, I've got a long way to go, but I'm feeling reasonably comfortable.", 60],
    ["Some experience, starting to get the hang of things.", 90],
    ["Good experience, probably know more than most people.", 120],
    ["Solid experience, not an expert, but I know what I'm doing.", 150],
    ["Expert, I know this in and out.. I won't lead you astray.", 180],
    ["Beyond an expert. Experts look up to me.", 210]
  ]

  def full_title
    "#{subject}: #{title}"
  end

  def complete?
    subject.present? && title.present? && body.present? && confidence_score.present?
  end

  def confidence_text
    (CONFIDENCE_SCORES.detect { |score_info| score_info[1] == confidence_score } || [])[0]
  end
end
