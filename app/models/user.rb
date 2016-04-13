class User < ApplicationRecord
  has_many :user_answers, dependent: :destroy

  def self.create_with_omniauth(auth)
    user = create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.name = auth['info']['name']
      user.github_url = auth['info']['urls']['GitHub']
    end

    user.reload
  end
end
