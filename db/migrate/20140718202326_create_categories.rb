class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :topic

      t.timestamps
    end
  end
end
