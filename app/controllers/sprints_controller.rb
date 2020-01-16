class SprintsController < ApplicationController

  def new 
  end

  def index
    @tickets = Ticket.all
  end


end
