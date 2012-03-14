class User < ActiveRecord::Base
  has_many :lessons, :order => "id desc"

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :nickname, :email, :password, :password_confirmation, :remember_me

  scope :with_lessons, includes(:lessons).where("lessons.published_at is not null")

  after_create :welcome
  after_create :notify_admin


  def display_name
    nickname.blank? ? name : nickname
  end

  def to_param
    id.to_obfuscated
  end

  private

  def welcome
    UserMailer.welcome(id).deliver    
  end

  def notify_admin
    AdminMailer.notify("A new user was created.", self.inspect).deliver
  end

end
