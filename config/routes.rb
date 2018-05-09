Rails.application.routes.draw do
  resources :owners do
    collection do
      post "import"
    end
  end
end