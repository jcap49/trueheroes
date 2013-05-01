class CreatePledges < ActiveRecord::Migration
  def change
    create_table :pledges do |t|
      t.string :first_name
      t.string :last_name
      t.string :activity
      t.date :date

      t.timestamps
    end
  end
end
