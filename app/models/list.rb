class List < ApplicationRecord

    include SoftDestroyer

    extend ActiveModel::Callbacks
    define_model_callbacks :soft_destroy, :restore, only: [:after]
    after_soft_destroy :soft_destroy_list_items
    after_restore :restore_list_items

    has_many :list_items, dependent: :destroy
    validates :name, presence: true


    scope :active, -> {where('deleted_at IS NULL')}
    scope :soft_destroyed, -> {where('deleted_at IS NOT NULL')}

    def soft_destroy_list_items
        self.list_items.each {|list_item| list_item.soft_destroy }
    end 

    def restore_list_items
        self.list_items.each {|list_item| list_item.restore }
    end 

end
