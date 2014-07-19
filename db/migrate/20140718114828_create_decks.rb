class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.string :title
      t.belongs_to :category

      t.timestamps
    end
  end
end
