class Registration < ActiveRecord::Base
  attr_accessible :address, :email, :name
  has_many :reg_lines, dependent: :destroy
  validates :name, :address, :email, presence: true
  validates_format_of     :email,     :with => /^[A-Z0-9_.%-]+@([A-Z0-9_]+\.)+[A-Z]{2,4}$/i,
                                       :message => "must be a valid e-mail address"
  
  def add_reg_lines_from_holder(holder)
    holder.reg_lines.each do |item|
	  item.holder_id = nil
	  reg_lines << item
	end
  end
end
