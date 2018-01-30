class AddEmailToResponse < ActiveRecord::Migration[5.1]
  def change
    add_column :responses, :email, :string
  end
end
