class AddCounterToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :user_answers_count, :integer, default: 0, null: false
  end
end
