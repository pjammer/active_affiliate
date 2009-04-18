ActionController::Routing::Routes.draw do |map|
  map.resources :affiliates
  map.resources :affiliate_links
  map.namespace :admin do |admin|
    admin.resources :affiliates
    admin.resources :affiliate_settings
    admin.resources :affiliate_links
    admin.resources :ad_photos, :member => {:crop_and_close => :post}
  end
end