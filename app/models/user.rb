class User < ActiveRecord::Base
    attr_accessible :email
    devise :database_authenticatable, :trackable, :validatable

    has_many :stories
    has_many :players

    validates :email, :presence => true
    validates :role, :presence => true
end
