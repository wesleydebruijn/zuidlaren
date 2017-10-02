class CreateRepositoriesUsersJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_table :repositories_users, id: false do |t|
      t.integer :repository_id
      t.integer :user_id
    end

    add_index :repositories_users, :repository_id
    add_index :repositories_users, :user_id
  end
end
