require "sidekiq/web"

Rails.application.routes.draw do
  # Sidekiq
  unless Rails.env.development?
    Sidekiq::Web.use ActionDispatch::Cookies
    Sidekiq::Web.use Rails.application.config.session_store, Rails.application.config.session_options
  end
  mount Sidekiq::Web => "/sidekiq"

  namespace :api do
    namespace :v1 do
      resources :disbursements, only: [:index]
    end
  end
end
