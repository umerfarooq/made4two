ActiveAdmin.register Tour do
  filter :title
  filter :location
  filter :supplier_company
  filter :type, :as => :select
  filter :created_at, :as => :date_range
  config.per_page = 10
  show do
    attributes_table do
      row :id
      row :title
      row :location
      row :price do |tour|
        number_to_currency(tour.price, :unit => '£')
      end
      row :image do |tour|
        image_tag(tour.image.thumb)
      end
      row :stuff
      row :type
      row :merchant
      row :availability
      row :blackout_date
      row :duration
      row :experience_location
      row :nearest_airport
      row :supplier_company
      row "What's Includes" do |tour|
        (tour.includes.map{ |p| '<li>'+p.description }).join('</li>').html_safe
      end
      row "Why We Loves" do |tour|
        (tour.we_loves.map{ |p| '<li>'+p.description }).join('</li>').html_safe
      end
      row :description do |tour|
        tour.description.html_safe
      end
      row "Gallery" do |tour|
        (tour.gallery_tours.map{ |p| image_tag(p.image.thumb) }).join(' ').html_safe
      end
      row :created_at
      row :updated_at
    end
  end
  form do |f|
    f.inputs "Details Tour" do
      f.input :title
      f.input :price
      f.input :supplier_company
      f.input :stuff_id, :as => :select, :collection => Stuff.all
      f.input :type, :as => :radio, :collection => ["local","getaway"]
      f.input :availability
      f.input :merchant
      f.input :blackout_date
      f.input :duration
      f.input :experience_location
      f.input :nearest_airport
      f.has_many :we_loves, :heading => 'We Love' do |wl|  
        if wl.object.id
          wl.input :_destroy, :as => :boolean, :label => 'Delete?'
        end
        wl.input :description
      end
      f.has_many :includes do |i|
        if i.object.id
          i.input :_destroy, :as => :boolean, :label => 'Delete?'
        end
        i.input :description
      end
      
    end
    f.inputs "Description" do
      f.input :description, :label => false
    end
    f.inputs "Location Tour" do
      f.input :location
      f.input :location, label: 'Location Map', input_html: {:class => 'maps'}
      #f.input :location, :name => 'location', :label => 'Location Map'
      f.input :latitude, :as => :hidden
      f.input :longitude, :as => :hidden
    end
    
    f.inputs "Photos" do
      f.input :image, :as => :file, :label => 'Image Header',:hint => f.template.image_tag(f.object.image.url(:thumb))
      f.has_many :gallery_tours do |gt|
        if gt.object.id
          gt.input :_destroy, :as => :boolean, :label => 'Delete?'
        end
        gt.input :title
        gt.input :image, as: 'file', :hint => gt.template.image_tag(gt.object.image.url(:thumb))
        gt.input :content
        gt.input :status, as: :select
      end
    end
    
    
    
    
    f.actions
    #render :partial => 'maps'
  end
  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
    def new
      @tour = Tour.new
    end
    def permitted_params
      params.permit(:utf8, :_method, :authenticity_token, :commit, :id,:tour => [:title, :location, :price, :image, :supplier_company, :stuff_id, :type, :availability, :merchant, :blackout_date, :duration, :experience_location, :nearest_airport, :latitude, :longtitude, :description, :longitude, :we_loves_attributes => [:id,:description,:_destroy], :includes_attributes => [:id,:description,:_destroy],:gallery_tours_attributes => [:id, :title, :content, :image, :status,:_destroy]] )
    end
    def create
      super
      if @tour.save
        MailSubscription.subscribe(@tour).deliver
      end
    end
  end
  index do
    selectable_column
    id_column
    column :title
    column :location
    column :supplier_company
    column :type
    column :price do |tour|
      number_to_currency(tour.price, :unit => '£')
    end
    actions
  end
end

