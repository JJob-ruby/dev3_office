class CreateTicketActivityLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :ticket_activity_logs do |t|

      #ticket_id is a foreign key to user table
      #user_id is a foreign key to user table

      #Log is of 1hour duration, from 0-23 hours. The ticket should be valid during the specified date
      t.integer :log_time
      t.date :log_date
      
      t.string :comment

      #approved_by is a foreign key

      t.timestamps
    end
  end
end
