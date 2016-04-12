class UserAnswer < ApplicationRecord
  after_create_commit { AnswerBroadcastJob.perform_later(self) }
end
