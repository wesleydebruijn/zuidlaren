class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :action
      t.references :event_group
      t.timestamps
    end
  end
end
