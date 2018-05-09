Rails.application.routes.draw do
  resources :owners do
    collection do
      post "import"
      get "import_instructions"
    end
  end
end