Rails.application.routes.draw do
  devise_for :users
  resources :events
  get "created_events", to: "user#created_events"
  get "attended_events", to: "user#attended_events"
  post "attend/:id", to: "user#attend", as: "attend_event"
  get "art_events", to: "events#art_events"

  get "up" => "rails/health#show", as: :rails_health_check

  root "static#home"
end
