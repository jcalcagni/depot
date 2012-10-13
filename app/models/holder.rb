class Holder < ActiveRecord::Base
   has_many :reg_lines, dependent: :destroy
   
   def add_event(event_id)
    current_item = reg_lines.find_by_event_id(event_id)
    current_item = reg_lines.build(event_id: event_id)
    current_item
  end
   
end
