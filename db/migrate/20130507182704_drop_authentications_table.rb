class DropAuthenticationsTable < ActiveRecord::Migration
  def self.up
    drop_table :authentications
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
