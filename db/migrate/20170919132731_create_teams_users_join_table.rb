class CreateTeamsUsersJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_table :teams_users, id: false do |t|
      t.integer :team_id
      t.integer :user_id
    end

    add_index :teams_users, :team_id
    add_index :teams_users, :user_id
  end
end
