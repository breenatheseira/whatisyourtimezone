class Users < ActiveRecord::Base
    has_secure_password
    
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates_format_of :email, :with => /\A\S+@\S+\.\S+\z/    
    validates :password, length: { minimum: 6 }, allow_blank: true
    
end
