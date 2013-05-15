class DropLinkedServicesTable < ActiveRecord::Migration
  def self.up
    drop_table :linked_services
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
