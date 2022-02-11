class Category < ApplicationRecord
    validates :name, :image_url, presence: true

    has_many :tools

end
