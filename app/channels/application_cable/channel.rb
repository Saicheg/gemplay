# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
module ApplicationCable
  class Channel < ActionCable::Channel::Base
    protected

    def current_user
      @current_user ||= User.find_by(uuid: params[:u_uuid])
    end
  end
end
