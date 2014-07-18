class CreateCollaborators < ActiveRecord::Migration
  def change
    create_table :collaborators do |t|
      t.references :user
      t.references :deck

      t.timestamps
    end
  end
end
