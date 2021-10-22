class AddTaskTagUniqueIndexToTaskTags < ActiveRecord::Migration[6.1]
  def change
    add_index :task_tags, [:task_id, :tag_id], unique: true
  end
end
