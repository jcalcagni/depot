class Inquiry < ActiveRecord::Base
    PRODUCT_INFO = [ "Cholecap (10mg)", "Cholecap (20mg)", "Labrinone (50mg)", "Labrinone (100mg)",
                     "Labrinone (100mg)", "Restolar (25mg)", "Voderal (200mg)", "Voderal (400mg)" ]
	
	attr_accessible :product, :inquiry, :contact_info, :email
	validates :inquiry, :contact_info, presence: true
    validates :product, inclusion: PRODUCT_INFO

	validates_format_of     :email,     :with => /^[A-Z0-9_.%-]+@([A-Z0-9_]+\.)+[A-Z]{2,4}$/i,
                                       :message => "must be a valid e-mail address"
									   
  def retrive_email(user)
    @user = user
	@user.email
	email
  end
  

end
