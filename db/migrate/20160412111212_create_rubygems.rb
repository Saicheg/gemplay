class CreateRubygems < ActiveRecord::Migration[5.0]
  def change
    unless table_exists?
      create_table :rubygems do |t|
        t.string :name

        t.timestamps
      end

      add_index :rubygems, :name, unique: true
    end
  end

  private

  def table_exists?
    ActiveRecord::Base.connection.table_exists?('rubygems')
  end
end
