class Order < ActiveRecord::Base
  attr_accessible :address, :email, :name
  has_many :line_items, dependent: :destroy
  
  validates :name, :address, :email, presence: true
  validates_format_of     :email,     :with => /^[A-Z0-9_.%-]+@([A-Z0-9_]+\.)+[A-Z]{2,4}$/i,
                                       :message => "must be a valid e-mail address"
									   
   def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
end
