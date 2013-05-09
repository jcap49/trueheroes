class RenameProfilepicColumnToPhoto < ActiveRecord::Migration
  def self.up
    rename_column :pledges, :profile_picture, :photo
  end

  def self.down
    rename_column :pledges, :photo, :profile_picture
  end
end
