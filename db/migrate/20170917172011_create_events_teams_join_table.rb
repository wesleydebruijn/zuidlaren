class CreateEventsTeamsJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_table :events_teams, id: false do |t|
      t.integer :event_id
      t.integer :team_id
    end

    add_index :events_teams, :event_id
    add_index :events_teams, :team_id
  end
end
