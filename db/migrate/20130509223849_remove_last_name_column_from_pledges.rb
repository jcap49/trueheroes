class RemoveLastNameColumnFromPledges < ActiveRecord::Migration
  def self.up
    remove_column :pledges, :last_name
  end

  def self.down
    add_column :pledges, :last_name
  end
end
