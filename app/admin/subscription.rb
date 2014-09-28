ActiveAdmin.register Subscription do
  config.per_page = 10
  actions :all, :except => [:new, :create, :edit, :update]
  
end
