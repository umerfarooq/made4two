ActiveAdmin.register Stuff do
  config.per_page = 10
  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end
  index do
    selectable_column
    id_column
    column :name
    column :type
    column :status do |stuff|
      if stuff.status == 1
        span :class => 'status_tag yes' do
          "Yes"
        end
      else
        span :class => 'status_tag no' do
          "No"
        end
      end
    end
    column :created_at
    actions
  end
  form do |f|
    f.inputs "New Stuff" do
      f.input :name
      f.input :type, as: :select, collection: ["local", "getaway"]
      f.input :status, as: :radio, collection: {'Yes' => '1', 'No' => '0'}
    end
    f.actions
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
