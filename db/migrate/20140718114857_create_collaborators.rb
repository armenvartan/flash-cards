class CreateCollaborators < ActiveRecord::Migration
  def change
    create_table :collaborators do |t|
      t.references :users
      t.references :decks

      t.timestamps
    end
  end
end
