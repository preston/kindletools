KindleTools::Application.routes.draw do
  resources :devices
  root :to => "welcome#index"

  post 'calculate_pid' => 'welcome#calculate_pid', as: 'calculate_pid'
  get 'instructions' => 'welcome#instructions', as: 'instructions'
  get 'about' => 'welcome#about', as: 'about'


end
