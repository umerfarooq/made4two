ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Recent Orders" do
          table_for Order.order('id desc').limit(10) do
            column("User")   {|order| link_to order.user.firstname+" "+order.user.lastname, admin_user_path(order.user_id)} 
            column("Amount"){|order| number_to_currency(order.amount/100, :unit => '£')} 
            column("Created At")   {|order| order.created_at } 
            column("Action"){|order| link_to "View", admin_order_path(order)}
          end
        end
      end
    end
    columns do
      
      column do
        panel "Recent Message" do
          table_for Message.order('id desc').limit(10) do
            column("Name")   {|message| message.name} 
            column("status"){|message| message.status} 
            column("Created At")   {|message| message.created_at }
            column("Action"){|message| link_to "View", admin_message_path(message)}
          end
        end
      end
      column do
        panel "Get in touch" do
          table_for GetInTouch.order('id desc').limit(10) do
            column("Name")   {|get_in_touch| get_in_touch.name} 
            column("Email"){|get_in_touch| get_in_touch.email} 
            column("Subject")   {|get_in_touch| get_in_touch.subject }
            column("Created at")   {|get_in_touch| get_in_touch.created_at }
            column("Action"){|get_in_touch| link_to "View", admin_get_in_touch_path(get_in_touch)}
          end
        end
      end
    end
  end
end
