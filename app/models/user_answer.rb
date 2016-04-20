# TODO resolve autoload issue and remove
require "#{Rails.root}/lib/rubygems/gem.rb"

class UserAnswer < ApplicationRecord
  belongs_to :user

  validates_presence_of :user, :text
  validates_uniqueness_of :text
  validates :text, format: { with:  /\A*[a-zA-Z]\z/, message: 'must contain letter at the end!' }
  validate :match_last_user?
  validate :match_existing_rubygem?
  validate :match_game_rule?

  after_create_commit { AnswerBroadcastJob.perform_later(self) }

  def last_letter
    self.text.each_char.reverse_each do |letter|
      if /[a-zA-Z]/.match(letter)
        return letter
      else
        errors[:base] << "Gemname must contain at least one letter!"
      end
    end
  end

  private

  def match_existing_rubygem?
    unless Rubygem.exists?(name: text) || Rubygems::Gem.exists?(text)
      errors[:base] << "There's no gem with name #{text.inspect}"
    end
  end

  def match_game_rule?
    if last_answer = UserAnswer.last
      last_answer_last_char = last_answer.last_letter
      new_answer_first_char = text.first

      unless last_answer_last_char == new_answer_first_char
        errors[:base] << "with #{last_answer_last_char.inspect}"
      end
    end
  end

  def match_last_user?
    if UserAnswer.last && (UserAnswer.last.user_id == self.user_id)
      errors[:base] << "Last answer is yours!"
    end
  end
end
