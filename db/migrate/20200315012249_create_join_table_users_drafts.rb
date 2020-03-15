class CreateJoinTableUsersDrafts < ActiveRecord::Migration[6.0]
  def change
    create_join_table :users, :drafts do |t|
      t.index [:user_id, :draft_id]
      t.index [:draft_id, :user_id]
    end
  end
end
