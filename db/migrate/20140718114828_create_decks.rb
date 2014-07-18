class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.string :topic

      t.timestamps
    end
  end
end
