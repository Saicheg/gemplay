# TODO resolve autoload issue and remove
require "#{Rails.root}/lib/rubygems/gem.rb"

class UserAnswer < ApplicationRecord
  belongs_to :user

  validates_presence_of :user, :text
  validates_uniqueness_of :text
  validate :match_existing_rubygem?
  validate :match_game_rule?

  after_create_commit { AnswerBroadcastJob.perform_later(self) }

  private

  def match_existing_rubygem?
    unless Rubygem.exists?(name: text) || Rubygems::Gem.exists?(text)
      errors[:base] << "There's no gem with name #{text.inspect}"
    end
  end

  def match_game_rule?
    if last_answer = UserAnswer.last
      last_answer_last_char = last_answer.text.last
      new_answer_first_char = text.first

      unless last_answer_last_char == new_answer_first_char
        errors[:base] << "with #{last_answer_last_char.inspect}"
      end
    end
  end
end
