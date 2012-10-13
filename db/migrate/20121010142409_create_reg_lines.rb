class CreateRegLines < ActiveRecord::Migration
  def change
    create_table :reg_lines do |t|
      t.integer :event_id
      t.integer :holder_id

      t.timestamps
    end
  end
end
