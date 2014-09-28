ActiveAdmin.register Order do
  config.per_page = 10
  actions :all, :except => [:new, :create]
  index do
    selectable_column
    id_column
    column :user_id do |order|
      link_to order.user.firstname + " " + order.user.lastname, admin_user_path(order.user_id)
    end
    column :amount do |order|
      number_to_currency(order.amount/100, :unit => '£')
    end
    column :gift
    column :created_at
    actions
  end
  show do |order|
    attributes_table do
      row :id
      row :user do |order|
        link_to order.user.firstname + " " + order.user.lastname, admin_user_url(order.user_id)
      end
      row :amount do |order|
        number_to_currency((order.amount)/100, :unit => '£')
      end
      row :discount do |order|
        order.discount.to_s + "%"
      end
      row :created_at
      row :stripe_card_token
      row "Item" do |order|
        (order.cart.line_items.map{|line_item| "<li><a href='#{admin_tour_url(line_item.tour_id)}'>"+line_item.tour.title}).join('</a></li>').html_safe
      end
      if order.gift == true
        row :gift
        row "Firstname Recipient" do |order|
          order.firstname
        end
        row "Lastname Recipient" do |order|
          order.lastname
        end
        row :message
        row :email
        row "Certicate to Recipient" do |order|
          order.certicate
        end
      end
    end
  end
end
