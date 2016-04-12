class CreateUserAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :user_answers do |t|
      t.integer :user_id
      t.string :text

      t.timestamps
    end
    add_index :user_answers, :user_id
  end
end
