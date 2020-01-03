class User < ApplicationRecord
  after_create :assign_default_role
  rolify :before_add => :before_add_method
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def before_add_method(role)
    p '----------------------------------role------------------------------'
    p role
    p '----------------------------------role------------------------------'
    # do something before it gets added
  end

  def assign_default_role
    self.add_role(:newuser) if self.roles.blank?
  end

  # attr_writer :login
  # attr_accessor :login

  # def login
  #   @login || self.username || self.email
  # end

  # def self.find_for_database_authentication warden_conditions
  #   conditions = warden_conditions.dup
  #   login = conditions.delete(:login)
  #   p '------------'
  #   p login
  #   p conditions
  #   where(conditions).where(["lower(username) = :value OR lower(email) = :value", {value: login.strip.downcase}]).first
  # end
end
