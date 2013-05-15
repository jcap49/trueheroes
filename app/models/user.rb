class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook, :twitter]

  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :provider, :uid
  has_attached_file :photo, :styles => {
    :small => "160x160>",
    :large => "525x525>"}

  has_many :pledges

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(
         name:auth.extra.raw_info.name,
         provider:auth.provider,
         uid:auth.uid,
         email:auth.info.email,
         password:Devise.friendly_token[0,20])
      # session[:pledge_id] = user.id
      # User.find(session[:pledge_id])
    end
    user
    # session[:pledge_id] = user.id
    # User.find(session[:pledge_id])
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.find_for_twitter_oauth(access_token, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(
        name:auth.extra.raw_info.name,
        provider:auth.provider,
        uid:auth.uid,
        email:auth.info.email,
        password:Devise.friendly_token[0,20])
    end
    user
  end
end

