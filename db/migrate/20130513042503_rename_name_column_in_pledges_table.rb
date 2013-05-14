class RenameNameColumnInPledgesTable < ActiveRecord::Migration
  def self.up
    rename_column :pledges, :name, :first_name
  end

  def self.down
    rename_column :pledges, :first_name, :name
  end
end
