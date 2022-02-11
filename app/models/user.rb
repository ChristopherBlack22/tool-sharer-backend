class User < ApplicationRecord
    has_secure_password
    
    has_many :owned_tools, class_name: "Tool", foreign_key: "owner_id"
    has_many :borrowed_tools, class_name: "Tool", foreign_key: "borrower_id"


end
