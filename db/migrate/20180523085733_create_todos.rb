class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :name
      t.text :description
      t.string :status, default: STATUS[:new]
      t.references :project

      t.timestamps null: false
    end
  end
end
