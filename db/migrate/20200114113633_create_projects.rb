class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|

      t.string :name
      t.text :description
      t.date :start_date
      t.boolean :status
      t.timestamps

    end
  end
end
