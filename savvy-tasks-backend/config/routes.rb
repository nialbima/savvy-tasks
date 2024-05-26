# frozen_string_literal: true

Rails.application.routes.draw do
  resources :tasks, only: [:index, :show]

  devise_for :users,
    path_names: {
      sign_in: "sign_in",
      sign_out: "sign_out",
      registration: "sign_up"
    },
    controllers: {
      sessions: "users/sessions",
      registrations: "users/registrations"
    }

  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/", graphql_path: "/graphql"
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", :as => :rails_health_check

  post "/graphql", to: "graphql#execute"
end
