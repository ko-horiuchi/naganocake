Rails.application.routes.draw do
  devise_for :customers
  devise_for :admins, path: 'admin', controllers: {
  sessions: 'admins/sessions'
}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admin do
   get root to: "homes#top"
  end

  namespace :admin do
   resources :items, except:[:destroy]
  end

  namespace :admin do
   resources :genres, only:[:index, :create, :edit, :update]
  end

  namespace :admin do
   resources :customers, only:[:index, :show, :edit, :update]
  end

   namespace :admin do
   resources :orders, only:[:show, :update]
  end

end
