class CreateTaskLists < ActiveRecord::Migration[6.0]
  def change
    create_table :task_lists do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
