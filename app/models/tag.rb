class Tag < ApplicationRecord
    validates :name, presence: true
    
    has_many :taggings
    has_many :list_items, through: :taggings
end
