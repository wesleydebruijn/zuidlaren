class CreateTodos < ActiveRecord::Migration[5.0]
  def change
    create_table :todos do |t|
      t.string :title
      t.boolean :completed
      t.references :team
      t.references :user

      t.timestamps
    end
  end
end
