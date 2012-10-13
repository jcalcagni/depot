class Event < ActiveRecord::Base
has_many :reg_lines

before_destroy :ensure_not_referenced_by_any_reg_line

attr_accessible :location, :eventdate, :eventtime, :title, :image_url
validates :title, :location, :eventdate, :eventtime, :image_url, presence: true
validates :title, uniqueness: true

validates :image_url, allow_blank: true, format: {
     with: %r{\.(gif|jpg|png)\Z}i,
     message: 'must be a URL for GIF, JPG or PNG image.'
	 }

validate :title, length: {minimum: 10}


  private
    #ensure no registration "line items" are referenced by this event
	def ensure_not_referenced_by_any_reg_line
	  if reg_lines.empty?
	    return true
	  else
	    error.add(:base, 'Registrations present')
		return false
	  end
	end
end
