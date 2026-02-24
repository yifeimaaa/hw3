class EntriesController < ApplicationController
  def new
    @place = Place.find_by(id: params["place_id"])
  end

  def create
    @entry = Entry.new
    @entry.title = params["title"]
    @entry.description = params["description"]
    @entry.occurred_on = params["occurred_on"]
    @entry.place_id = params["place_id"]
    @entry.save
    
    # Redirects back to the specific place's detail page
    redirect_to "/places/#{@entry.place_id}"
  end
end