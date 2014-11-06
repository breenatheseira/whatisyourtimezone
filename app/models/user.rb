class User < ActiveRecord::Base
    has_secure_password
    
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates_format_of :email, :with => /\A\S+@\S+\.\S+\z/    
    validates :password, length: { minimum: 6 }, allow_blank: true
    
    has_one :profile
    has_many :timezone
    accepts_nested_attributes_for :timezone, update_only: true, allow_destroy: true
    accepts_nested_attributes_for :profile, update_only: true
    
end
