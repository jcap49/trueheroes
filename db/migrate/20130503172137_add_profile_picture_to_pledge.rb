class AddProfilePictureToPledge < ActiveRecord::Migration
  def self.up
    add_column :pledges, :profile_picture, :string
  end

  def self.down

  end
end
