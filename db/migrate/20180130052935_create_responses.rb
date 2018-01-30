class CreateResponses < ActiveRecord::Migration[5.1]
  def change
    create_table :responses do |t|
      t.uuid :session, default: 'uuid_generate_v4()'
      t.uuid :view, default: 'uuid_generate_v4()'
      t.json :answers

      t.timestamps
    end
    add_index :responses, :session
    add_index :responses, :view
  end
end
