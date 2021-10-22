class AddNameUserUniqueIndexToTags < ActiveRecord::Migration[6.1]
  def change
    add_index :tags, [:user_id, :name], unique: true
  end
end
