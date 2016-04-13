class AddUuidToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :uuid, :uuid, null: false, default: 'uuid_generate_v4()'
    add_index :users, :uuid
  end
end
