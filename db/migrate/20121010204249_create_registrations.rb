class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.string :name
      t.text :address
      t.string :email

      t.timestamps
    end
  end
end
