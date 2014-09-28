ActiveAdmin.register GetInTouch do
  index do
    selectable_column
    id_column
    column :name
    column :subject
    column :created_at
    actions
  end
  show do
    attributes_table do
      row :id
      row :name
      row :subject
      row :message do |get_in_touch|
        strip_tags(get_in_touch.message)
      end
      row :created_at
      row :updated_at
    end
  end
end
