ActiveAdmin.register Page do
  before_filter :skip_sidebar!, :only => :index
  actions :all, except: [:show, :create, :new]
  
  index do
    selectable_column
    id_column
    column :name
    actions
  end
  form do |f|
    f.inputs do
      f.input :name
      f.input :content
      f.input :image, as: :file, :hint => f.template.image_tag(f.object.image.url(:thumb)) if f.object.image?
      
    end
    f.has_many :detail_abouts, :heading => false, :new_record => false do |da|
      da.input :name, input_html: {disabled: true}
      da.input :content
    end
    f.actions
  end
  controller do
    def permitted_params
      params.permit(:utf8, :_method, :authenticity_token, :commit, :id,:page => [:image, :name, :permalink, :content, :detail_abouts_attributes => [:id,:name, :content]] )
    end
  end
end
