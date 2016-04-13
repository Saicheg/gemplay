class SessionsController < ApplicationController
  def create
    @user = User.find_by(provider: auth_params['provider'], uid: auth_params['uid'])
    @user ||= User.create_with_omniauth(auth_params)

    if @user
      session[:user_id] = @user.id
      cookies[:u_uuid] = @user.uuid
    end

    redirect_to root_url
  end

  private

  def auth_params
    @auth ||= request.env['omniauth.auth']
  end
end
