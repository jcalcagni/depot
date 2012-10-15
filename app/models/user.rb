class User < ActiveRecord::Base
  attr_accessible :firstname, :lastname, :username, :email, :licensest, :licenseno, :specialty, :password, :password_confirmation, :avatar
  
  validates :username, presence: true, uniqueness: true
  validates_uniqueness_of :email, :case_sensitive => false
  validates_length_of :email, :within => 6..50
  validates_length_of :password, :within => 6..30
  validates_confirmation_of :password
  validates_format_of     :email,     :with => /^[A-Z0-9_.%-]+@([A-Z0-9_]+\.)+[A-Z]{2,4}$/i,
                                       :message => "must be a valid e-mail address"
  validates_presence_of :firstname, :lastname
  mount_uploader :avatar, AvatarUploader
  has_secure_password  
  
end
