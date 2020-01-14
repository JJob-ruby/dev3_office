class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|

      t.string :name
      t.text :description
# created by is a key
      t.boolean :status
      t.integer :maximum_permitted_time
      t.string :category
      t.date :start_date
      t.date :end_date
# timestamp automatically creates the created_on fields	
      t.timestamps
    end
  end
end
