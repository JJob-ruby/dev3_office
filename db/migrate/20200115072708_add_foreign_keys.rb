class AddForeignKeys < ActiveRecord::Migration[6.0]
  def change


    add_reference :ticket_activity_logs, :tickets, foreign_key: true #ticked concerned
######
    add_reference :ticket_activity_logs, :users, foreign_key: true #user of the ticket
######
    add_reference :projects, :users, foreign_key: true #manager_id


    add_reference :user_projects, :projects, foreign_key: true
    add_reference :user_projects, :users, foreign_key: true


    add_reference :sprints, :projects, foreign_key: true


    add_reference :tickets, :projects, foreign_key: true
    add_reference :tickets, :sprints, foreign_key: true


  end
end
	
