Rails.application.routes.draw do

  #place custom routes above the resources, otherwise it matches with the show action

  # get request to hospitals#populate_state_list,with parameter country to get states of the country
  get 'hospitals/populate_state_list', to: 'hospitals#populate_state_list'

  # get request to hospitals#populate_city_list,with parameter country, state to get city of the state
  get 'hospitals/populate_city_list', to: 'hospitals#populate_city_list'

  #resources for hospital
  resources :hospitals

  #devise generated controller for users
  #since we needed to make changes in controller, and generated those files, we n=must speify the controllers
  devise_for :users, controllers: {sessions: 'users/sessions', registrations: 'users/registrations'}

  #welcome page
  get 'welcome/index'

  #set default, can be found in welcome_controller.rb
  root 'welcome#index'
end
