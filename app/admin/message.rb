ActiveAdmin.register Message do
  config.per_page = 10
  actions :all, :except => [:new, :create]
  permit_params :status
  index do
    selectable_column
    id_column
    column :subject
    column :name
    column "Show the message?", :status
    actions
  end
  form do |f|
    f.inputs "Change status message" do
      f.input :status, :as => :radio, :label => "Show the message?"
    end
    f.actions
  end
end
