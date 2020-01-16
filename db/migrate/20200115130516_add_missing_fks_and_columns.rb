class AddMissingFksAndColumns < ActiveRecord::Migration[6.0]
  def change
    add_reference(:ticket_activity_logs, :created_by, foreign_key: {to_table: :users})
    add_reference(:ticket_activity_logs, :approved_by, foreign_key: {to_table: :users})
  end
end
