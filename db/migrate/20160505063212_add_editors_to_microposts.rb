class AddEditorsToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :editor, :string
  end
end
