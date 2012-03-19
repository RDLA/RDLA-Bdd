class User < ActiveRecord::Base
    devise :database_authenticatable, :trackable, :validatable

    validates :email, :presence => true
    validates :role, :presence => true
end
