Rails.application.routes.draw do
  root "owners#mode"
  
  resources :owners do
    collection do
      post "import"
      get "import_instructions"
      get "csv_preview"
      get "template"
    end
  end
end