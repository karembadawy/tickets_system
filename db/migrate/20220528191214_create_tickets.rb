class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.string :title, null: false
      t.text :description
      t.references :user, foreign_key: true
      t.datetime :due_date
      t.integer :status, default: 0, null: false
      t.integer :progress, default: 0, null: false

      t.timestamps
    end
  end
end
