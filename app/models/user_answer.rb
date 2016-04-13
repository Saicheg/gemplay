# TODO resolve autoload issue and remove
require "#{Rails.root}/lib/rubygems/gem.rb"

class UserAnswer < ApplicationRecord
  belongs_to :user

  validates_presence_of :user
  validates_uniqueness_of :text
  validate :match_existing_rubygem?

  after_create_commit { AnswerBroadcastJob.perform_later(self) }

  private

  def match_existing_rubygem?
    unless Rubygem.exists?(name: text) || Rubygems::Gem.exists?(text)
      errors[:base] << "There's no gem with name #{text.inspect}"
    end
  end
end
