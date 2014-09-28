ActiveAdmin.register ImageHeader, as: 'Headers' do
  config.per_page = 10

  show do
    attributes_table do
      row :id
      row :title
      row :description
      row :created_at
      row :updated_at
      row :image do
        image_tag(image_header.image.thumb)
      end
    end
  end
  index do 
    selectable_column
    id_column
    column :title
    column :image do |image_header|
      image_tag image_header.image_url(:thumb)
    end
    column :status
    actions
  end
  controller do
    def permitted_params
      params.permit(:image_header => [:description, :image, :status, :title])
    end
  end
  form do |f|
    f.inputs "ImageHeader" do
      f.input :title
      f.input :image, :as => :file
      f.input :description
      f.input :status, :label => 'Active', :as => :radio
    end
    f.actions
  end
end
