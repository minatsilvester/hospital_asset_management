class HospitalsController < ApplicationController

  #new action needs hospital initialized so that simple_form_for will work
  def new
    @hospital = Hospital.new
    @states = nil
  end

  #not yt done anything with the show action
  def show
  end

  #action for getting state list based on country
  #responds with a json captured and sent to form by hospital.js
  def populate_state_list
    country = params[:country]
    puts(country)
    if country == ""
      @states = []
    else
      #converting string to a atom, request gives a string(eg "IN" for india).
      symbolized_country = country.parameterize.underscore.to_sym #"IN" -> :in
      @states = CS.get(symbolized_country)
      # @states = ["tn", "mh"]
      puts(@states)
    end
    #responding to the get request wit a json object
    respond_to do |format|
      format.json { render json: @states }
    end
  end

  #action for getting cities list based on state
  #responds with a json captured and sent to form by hospital.js
  def populate_city_list
    country = params[:country]
    state = params[:state]
    if state == ""
      @cities = []
    else
      #converting string to a atom, request gives a string(eg "IN" for india).
      symbolized_country = country.parameterize.underscore.to_sym #"IN" -> :in
      @cities = CS.get(symbolized_country, state)
      # @states = ["tn", "mh"]
      puts(@cities)
    end
    #responding to the get request wit a json object
    respond_to do |format|
      format.json { render json: @cities }
    end
  end


  #params should be allowed for entry and retrival from database
  private
  def hospital_params
    params.require(:hospital).permit(:name, :primary_email, :country, :city, :address, :phone)
  end

end
