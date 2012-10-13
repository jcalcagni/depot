class AddRegistrationIdToRegLine < ActiveRecord::Migration
  def change
    add_column :reg_lines, :registration_id, :integer

  end
end
