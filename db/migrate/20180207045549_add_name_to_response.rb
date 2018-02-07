class AddNameToResponse < ActiveRecord::Migration[5.1]
  def change
    add_column :responses, :name, :string
  end
end
