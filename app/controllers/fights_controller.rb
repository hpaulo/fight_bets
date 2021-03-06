class FightsController < ApplicationController
  load_and_authorize_resource

  def index
    @events = Event.includes(:fights, :fights => :result).all
    @fights = Fight.includes(:result).all
  end

  def new
    @fight = Fight.new
  end

  def create
    event_id = params[:fight].delete(:event_id)
    @fight = Fight.new(params[:fight])
    @fight.event_id = event_id

    puts "event_id #{event_id}"

    @fight.save

    redirect_to event_path(@fight.event)
   # @fight = Fight.new
   # @fight.category   = params[:fight][:category]
   # @fight.contender  = params[:fight][:contender]
   # @fight.challenger = params[:fight][:challenger]
   # @fight.save

   # redirect_to fights_path
  end

  def destroy
    @fight = Fight.find(params[:id])
    @fight.destroy

    respond_to do |format|
      format.html { redirect_to fights_url }
    end
  end
end
