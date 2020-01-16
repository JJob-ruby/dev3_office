class TicketActivityLogsController < ApplicationController

  def new 
  end

  def index
    @ticket_activity_logs = TicketActivityLog.all
  end


end
