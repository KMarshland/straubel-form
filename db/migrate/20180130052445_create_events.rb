class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.uuid :session, default: 'uuid_generate_v4()'
      t.uuid :view, default: 'uuid_generate_v4()'
      t.datetime :time
      t.string :question
      t.string :kind

      t.timestamps
    end
    add_index :events, :session
    add_index :events, :view
  end
end
