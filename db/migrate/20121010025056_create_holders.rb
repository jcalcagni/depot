class CreateHolders < ActiveRecord::Migration
  def change
    create_table :holders do |t|

      t.timestamps
    end
  end
end
