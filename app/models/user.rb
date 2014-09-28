class User < ActiveRecord::Base
  validates_presence_of :firstname, :lastname, :phone_number, :username, message: "can't blank"
  # validates_presence_of :address1, :address2, :city, :state,:country, :on => :edit
  validates :username, uniqueness: true
  validates :phone_number, numericality: true
  validates_format_of :username, without: /\s/, message: 'not allow white space'
  validates_format_of :username, with: /\A[a-z0-9]+\Z/, message: 'only allow lowercase characters and numbers'

  devise :invitable, :database_authenticatable, :registerable,:omniauthable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,:authentication_keys => [:login]
  has_many :invitations, :class_name => self.to_s, :as => :invited_by
  has_many :orders, dependent: :destroy
  has_many :vouchers
  def login=(login)
    @login = login
  end

  def login
    @login || self.username || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

  def country_name
    country = ISO3166::Country[country_code]
    country.translations[I18n.locale.to_s] || country.name
  end
  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.username = auth.info.nickname
    end
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  def password_required?
    super && provider.blank?
  end

  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end
end
