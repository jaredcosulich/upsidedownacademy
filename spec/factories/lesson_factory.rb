Factory.define :lesson do |l|
  l.association :user
  l.subject "A Subject"
  l.specific_subject "Specific Subject"
  l.title "A Lesson"
end
