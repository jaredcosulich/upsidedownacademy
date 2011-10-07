class Lesson < ActiveRecord::Base
  belongs_to :user
  has_many :videos
  has_many :photos
  has_many :references

  scope :recent, order("created_at desc")
  scope :published, where("published_at is not null")

  CONFIDENCE_SCORES = [
    ["Just getting started, basically no idea what I'm doing.", 0],
    ["Not clueless, it's no longer a completely foreign language.", 10],
    ["A little experience, I'm kind of figuring it out.", 20],
    ["Novice, I've got a long way to go, but I'm starting to feel comfortable.", 30],
    ["Some experience, getting the hang of things.", 40],
    ["I'm probably in the middle of the pack. I've got a decent idea what I'm doing.", 50],
    ["Good experience, I probably know more than average.", 60],
    ["Solid experience, not an expert, but I know what I'm doing.", 70],
    ["Probably not an expert yet, but I'm close. I've got a very good understanding.", 80],
    ["Expert, I know this in and out.. I won't lead you astray.", 90],
    ["Beyond an expert. Experts look up to me.", 100]
  ]

  def full_title
    "#{subject}: #{specific_subject}: #{title}"
  end

  def complete?
    subject.present? && title.present? && body.present? && confidence_score.present?
  end

  def confidence_text
    score = CONFIDENCE_SCORES.detect { |score_info| score_info[1] == confidence_score }
    score.nil? ? "" : "#{score[1]}: #{score[0]}"
  end

  def to_param
    "#{id}_#{subject.sluggify}_#{specific_subject.sluggify}_#{title.sluggify}".downcase
  end
end
