ActiveAdmin.register Voucher do
  config.per_page = 10
  permit_params :code, :discount, :user_id
  form do |f|
    f.inputs "New Voucher" do
      f.input :code
      f.input :discount
      f.input :user_id, as: :select, collection: User.all
    end
    f.actions
  end
  controller do
    def new
      @voucher = Voucher.new
    end
    def create
      super
      if @voucher.save
        VoucherNotifier.notifier(@voucher).deliver
      end
    end
  end
end
