# Linked accounts allow a User to link 3rd party services (Twitter, etc.)
# to their account, and also authenticate with them.
#
# There are a few different scenarios we need to handle:
# - Logged in and:
# -- Already have matching linked account -> done
# -- Do not have matching linked account -> create and attach to user
# - Logged out and:
# -- Already have matching linked account with a user -> log them in
# -- Do not have matching linked account -> create a user
class LinkedService < ActiveRecord::Base
  belongs_to :user

  PROVIDERS = %w{facebook twitter}

  ### ATTRIBUTES
  store :meta

  attr_accessor :auth_hash
  attr_accessible :provider, :uid, :token, :secret, :auth_hash

  validates :provider, :uid, :token, presence: true
  validates :provider, inclusion: { in: PROVIDERS }

  ### CALLBACKS
  before_create :store_provider_info

  protected

  def store_provider_info
    if self.provider == 'twitter'
      self.meta[:username] = self.auth_hash['info']['nickname']
      self.meta[:full_name] = self.auth_hash['info']['name']
    elsif self.provider == 'facebook'
      self.meta[:email] = self.auth_hash['info']['email']
      self.meta[:username] = self.auth_hash['info']['nickname']
      self.meta[:first_name] = self.auth_hash['info']['first_name']
      self.meta[:last_name] = self.auth_hash['info']['last_name']
      self.meta[:full_name] = "#{self.meta[:first_name]} #{self.meta[:last_name]}"
    end
  end
end
