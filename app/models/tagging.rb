class Tagging < ApplicationRecord
    include SoftDestroyer
    belongs_to :tag
    belongs_to :list_item
end
