class UserAnswer < ApplicationRecord
  belongs_to :user

  validates_presence_of :user

  after_create_commit { AnswerBroadcastJob.perform_later(self) }
end
