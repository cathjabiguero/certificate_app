Rails.application.routes.draw do
  get "owners/index"
  root "owners#index"
  resources :owners do
    collection do
      post "import"
      get "import_instructions"
      get "csv_preview"
    end
  end
end