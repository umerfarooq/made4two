class HomeController < ApplicationController
  before_filter :authenticate_user!, :only => [:personal_user]
  def index
    @tours = Tour.all
    #@new_local = Tour.find_by(type: 'local')
    @new_local = Tour.local
    @sale_locals = Tour.where(type: 'local').order('price asc').limit(2)
    #@new_getaway = Tour.find_by(type: 'getaway')
    #@new_getaway = Tour.getaway
    @new_getaway = Tour.order(id: :desc).find_by(type: 'getaway')
    @sale_getaways = Tour.where(type: 'getaway').order('price asc').limit(2)
    @image_headers = ImageHeader.active

  end
  def personal_user
    @count_user = User.where.not(confirmed_at: nil).where(invited_by_id: current_user.id).count(:all)
    @invites = User.where(invited_by_id: current_user.id)
  end
  def about
    @get_in_touch = GetInTouch.new
    @few_word = DetailAbout.find_by(page_id: '1', name: 'Few Words')
    @why = DetailAbout.find_by(page_id: '1', name: 'Why Choose')
    @about = Page.find_by(permalink: 'about')
  end
  def i_wanna
    @messages = Message.where(status: true).order(id: :desc).page(params[:page]).per(3)
  end
  def stuff_local
    @stuff = Stuff.find(params[:id])
    @tours = Tour.where(stuff_id: params[:id])
  end
  def complete
    @order = Order.order(id: :desc).find_by(user_id: current_user.id)
    @line_items = LineItem.where(cart_id: @order.cart_id)
  end
  def local
    @high_price = Tour.where(type: 'local').order(price: :desc)
    @lower_price = Tour.where(type: 'local').order(price: :asc)
  end
  def getaway
    @high_price = Tour.where(type: 'getaway').order(price: :desc)
    @lower_price = Tour.where(type: 'getaway').order(price: :asc)
  end
  def terms
    @page = Page.find_by(permalink: 'terms')
  end
  def privacy
    @page = Page.find_by(permalink: 'privacy')
  end
end