class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :username
      t.string :email
      t.string :licensest
      t.integer :licenseno
      t.string :specialty
      t.string :password_digest
      t.string :salt

      t.timestamps
    end
  end
end
