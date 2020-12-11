Rails.application.routes.draw do
  
  devise_for :installs
root to: 'shifts#index'
end
