class User < ActiveRecord::Base
    attr_accessible :email, :password, :password_confirmation, :red_color, :green_color, :blue_color,:id
    devise :database_authenticatable, :trackable, :validatable

    has_many :stories
    has_many :players

    validates :email, :presence => true
    validates :role, :presence => true
    validates :password, :confirmation => true

    validates :red_color,  :numericality => {:greater_than_or_equal_to => 0, :less_than_or_equal_to => 255}
    validates :green_color,  :numericality => {:greater_than_or_equal_to => 0, :less_than_or_equal_to => 255}
    validates :blue_color,  :numericality => {:greater_than_or_equal_to => 0, :less_than_or_equal_to => 255}
end
