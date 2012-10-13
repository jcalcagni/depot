class User < ActiveRecord::Base
  attr_accessible :firstname, :lastname, :username, :email, :licensest, :licenseno, :specialty, :password, :password_confirmation
  validates :username, presence: true, uniqueness: true
  validates_uniqueness_of :e_mail, :case_sensitive => false
  validates_length_of :e_mail, :within => 6..50
  validates_length_of :password, :within => 6..3
  validates_confirmation_of :password
  validates_format_of     :e_mail,     :with => /^[A-Z0-9_.%-]+@([A-Z0-9_]+\.)+[A-Z]{2,4}$/i,
                                       :message => "must be a valid e-mail address"
  validates_presence_of :firstname, :lastname
  has_secure_password
end
