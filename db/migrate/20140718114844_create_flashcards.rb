class CreateFlashcards < ActiveRecord::Migration
  def change
    create_table :flashcards do |t|
      t.string :question, :answer
      t.references :deck

      t.timestamps
    end
  end
end
