class User < ActiveRecord::Base
    attr_accessible :email, :password, :password_confirmation
    devise :database_authenticatable, :trackable, :validatable

    has_many :stories
    has_many :players

    validates :email, :presence => true
    validates :role, :presence => true
    validates :password, :confirmation => true
end
