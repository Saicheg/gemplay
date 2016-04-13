class AddUniqueIndexForTextFromUserAnswers < ActiveRecord::Migration[5.0]
  def change
    add_index :user_answers, :text, unique: true
  end
end
