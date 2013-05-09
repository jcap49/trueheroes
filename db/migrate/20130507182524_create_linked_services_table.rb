class CreateLinkedServicesTable < ActiveRecord::Migration
   def change
    create_table :linked_services do |t|
      t.references :user

      t.text :meta

      t.string :provider, null: false
      t.string :uid, null: false
      t.string :token, null: false
      t.string :secret

      t.timestamps
    end

    add_index :linked_services, :user_id
    add_index :linked_services, [:user_id, :provider], unique: true
  end
end
