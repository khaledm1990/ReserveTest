class Tag < ApplicationRecord
    has_many :taggings
    has_many :list_items, through: :taggings
end
