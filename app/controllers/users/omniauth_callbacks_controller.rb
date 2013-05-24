class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    user = User.find_for_facebook_oauth(request.env["omniauth.auth"])

    if user.persisted? && session[:pledge_id] != nil
      @pledge = Pledge.find_by_id(session[:pledge_id])
      @pledge.user_id = user.id
      @pledge.save
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook"
      sign_in_and_redirect user, :event => :authentication
    elsif user.persisted? && session[:pledge_id] == nil
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook"
      sign_in_and_redirect user, :event => :authentication
    else
      session["devise.github_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  # def twitter
  #   user = User.find_for_twitter_oauth(request.env["omniauth.auth"])

  #   if user.persisted?
  #     flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Twitter"
  #     sign_in_and_redirect user, :event => :authentication
  #   else
  #     session["devise.github_data"] = request.env["omniauth.auth"]
  #     redirect_to new_user_registration_url
  #   end
  # end
end
