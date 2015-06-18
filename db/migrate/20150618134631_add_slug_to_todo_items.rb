class AddSlugToTodoItems < ActiveRecord::Migration
  def change
    add_column :todo_items, :slug, :string
    add_index :todo_items, :slug
  end
end
