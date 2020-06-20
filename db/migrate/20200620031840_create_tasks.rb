class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.references :task_list, null: false, foreign_key: true
      t.string :description
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
