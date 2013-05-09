class AuthenticationsController < ApplicationController
  def index
    @authentications = Authentication.all
  end

  def show
    @authentication = Authentication.find(params[:id])
  end

  def new
    @authentication = Authentication.new
  end

  def create
    @authentication = Authentication.new(params[:authentication])
    if @authentication.save
      redirect_to @authentication, :notice => "Successfully created authentication."
    else
      render :action => 'new'
    end
  end

  def edit
    @authentication = Authentication.find(params[:id])
  end

  def update
    @authentication = Authentication.find(params[:id])
    if @authentication.update_attributes(params[:authentication])
      redirect_to @authentication, :notice  => "Successfully updated authentication."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @authentication = Authentication.find(params[:id])
    @authentication.destroy
    redirect_to authentications_url, :notice => "Successfully destroyed authentication."
  end

  def home

  end

  def twitter
    omni = request.env["omniauth.auth"]
    authentication = Authentication.find_by_provider_and_uid(omni['provider'], omni['uid'])

    if authentication
      flash[:notice] = "Logged in successfully!"
      sign_in_and_redirect User.find(authentication.user_id)
    elsif current_user
      token = omni['credentials'].token
      token_secret = omni['credentials'].secret

      current_user.authentications.create!(:provider => omni['provider'])
      flash[:notice] = "Authentication successful!"
      sign_in_and_redirect current_user
    else
      user = User.new
      user.apply_omniauth(omni)

      if user.save
        flash[:notice] = "logged in"
        sign_in_and_redirect User.find(user.id)
      else
        session[:omniauth] = omni.except('extra')
        redirect_to new_user_registration_path
      end
    end



  end
end
