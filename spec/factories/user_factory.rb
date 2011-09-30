Factory.sequence :email do |n|
  "person#{n}@example.com"
end

Factory.sequence :name do |n|
  "person#{n}"
end

Factory.define :user do |u|
  u.name {Factory.next :name}
  u.email {Factory.next :email}
  u.password "password"
  u.password_confirmation "password"
end
