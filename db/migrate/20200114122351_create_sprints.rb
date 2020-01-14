class CreateSprints < ActiveRecord::Migration[6.0]
  def change
    create_table :sprints do |t|
	
      t.string :name
      t.date :start_date
      t.date :end_date
      t.boolean :status
      t.timestamps
    end
  end
end
