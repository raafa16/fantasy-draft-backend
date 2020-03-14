class CreateDrafts < ActiveRecord::Migration[6.0]
  def change
    create_table :drafts do |t|
      t.string :name, null: false

      t.timestamps
    end
    add_index :drafts, :name
  end
end
