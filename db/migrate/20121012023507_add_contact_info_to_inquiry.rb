class AddContactInfoToInquiry < ActiveRecord::Migration
  def change
    add_column :inquiries, :contact_info, :text

  end
end
