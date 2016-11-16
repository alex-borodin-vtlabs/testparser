Rails.application.routes.draw do
    namespace 'api' do
      namespace :v0 do
        resources :pages, only: [:index, :create, :show]
      end
    end
end
