class AddUserIdPledges < ActiveRecord::Migration
  def self.up
    add_column :pledges, :user_id, :integer
  end

  def self.down
    remove_column :pledges, :user_id, :integer
  end
end
