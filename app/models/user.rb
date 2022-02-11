class User < ApplicationRecord
    has_secure_password #automatically validates
    validates :username, :email, presence: true 
    validates :username, uniqueness: { case_sensitive: false }
    
    has_many :owned_tools, class_name: "Tool", foreign_key: "owner_id", dependent: :destroy
    has_many :borrowed_tools, class_name: "Tool", foreign_key: "borrower_id"

end
