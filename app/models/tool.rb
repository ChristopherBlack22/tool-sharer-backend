class Tool < ApplicationRecord
    belongs_to :owner, class_name: "User"
    belongs_to :borrower, class_name: "User", optional: true
    belongs_to :category


end
