class CreateUsersDrafts < ActiveRecord::Migration[6.0]
  def change
    create_table :users_drafts, id: false do |t|
      t.belongs_to :user
      t.belongs_to :draft
    end
  end
end
