class CreateEventsRepositoriesJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_table :events_repositories, id: false do |t|
      t.integer :event_id
      t.integer :repository_id
    end

    add_index :events_repositories, :event_id
    add_index :events_repositories, :repository_id
  end
end
