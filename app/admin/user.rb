ActiveAdmin.register User do
  actions :all, :except => [:new, :create, :edit, :update]
  config.per_page = 10
  filter :firstname
  filter :lastname
  filter :email
  index do
    selectable_column
    id_column
    column :firstname
    column :lastname
    column :email
    column :phone_number
    actions
  end
  show do
    attributes_table do
      row :id
      row :firstname
      row :lastname
      row :username
      row :gender
      row :age
      row :email
      row :phone_number
      row :address do |tour|
        tour.address1
      end
      row :address2 do |tour|
        tour.address2
      end
      row :city
      row :state
      row :country
      row :created_at
    end
  end  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  
end
