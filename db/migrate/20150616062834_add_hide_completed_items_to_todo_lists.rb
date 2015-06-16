class AddHideCompletedItemsToTodoLists < ActiveRecord::Migration
  def change
    add_column :todo_lists, :hide_completed_items, :boolean, default: false
  end
end
