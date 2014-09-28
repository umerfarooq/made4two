module ApplicationHelper
  def resource_name
    :user
  end
  def resource
    @resource ||= User.new
  end
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
  def twitter_share
    url = URI.escape(request.host+request.fullpath)
    title = params[:controller]
    link = "https://twitter.com/home?status=#{title} #{url}"
  end
  def facebook_share
    url = URI.encode(request.host+request.fullpath)
    link = "http://www.facebook.com/sharer.php?u=#{url}"
  end
  def pinterest_share
    url = URI.encode(request.host+request.fullpath)
    title = params[:controller]
    img = URI.encode('http://made4two-app.herokuapp.com/assets/couple-8b5a50a97ee5e33b4e65eaa60ab83f93.jpg')
    link =  "http://www.pinterest.com/pin/create/button/?url=#{url}&media=#{img}&description=#{title}"
  end
end
