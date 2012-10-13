class CreateInquiries < ActiveRecord::Migration
  def change
    create_table :inquiries do |t|
      t.string :product
      t.text :inquiry

      t.timestamps
    end
  end
end
