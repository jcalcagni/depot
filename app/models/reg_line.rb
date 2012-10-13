class RegLine < ActiveRecord::Base
   belongs_to :registration
   belongs_to :event
   belongs_to :holder
   attr_accessible :holder_id, :event_id
   
end
