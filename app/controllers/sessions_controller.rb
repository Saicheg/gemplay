class SessionsController < ApplicationController
  def create
    @user = User.find_by(provider: auth_params['provider'], uid: auth_params['uid'])
    @user ||= User.create_with_omniauth(auth_params)

    if @user
      session[:user_id] = @user.id
      # TODO to improve level of security we can ask about user with ajax and do not persist cookies parameters
      cookies[:u_uuid] = { value: @user.uuid, expires: 1.day.from_now }
    end

    redirect_to root_url
  end

  private

  def auth_params
    @auth ||= request.env['omniauth.auth']
  end
end
