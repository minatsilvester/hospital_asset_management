class HospitalsController < ApplicationController

  #new action needs hospital initialized so that simple_form_for will work
  def new
    @hospital = Hospital.new
  end

  #create action checks for presence and then add if hospital does not exists
  def create
    @hospital = Hospital.new(hospital_params)
    already_existing_hospital = Hospital.find_by(primary_email: hospital_params[:primary_email])
    if already_existing_hospital
      redirect_to new_user_registration_path(hospital_exists?: true), notice: "Hospital Already Exists"
    else
      @saved_hospital = @hospital.save
      redirect_to new_user_registration_path(hospital_exists?:true)
    end
  end

  #not yet done anything with the show action
  def show
  end

  #action for getting state list based on countrysa
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
      # puts(@states)
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
      # puts(@cities)
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
