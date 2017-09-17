class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :github_username
      t.string :slack_username
      t.references :team
      t.timestamps
    end
  end
end
