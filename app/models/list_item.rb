class ListItem < ApplicationRecord
	include SoftDestroyer
	extend ActiveModel::Callbacks
	define_model_callbacks :soft_destroy, :restore, only: [:after]
	after_soft_destroy :soft_destroy_taggings
	after_restore :restore_taggings

	has_many :taggings, dependent: :destroy
	has_many :tags, through: :taggings
	has_many :current_tags ,-> {where('deleted_at IS NULL')} ,foreign_key: "tag_id", source: :tag, through: :taggings
	has_many :removed_tags ,-> {where('deleted_at IS NOT NULL')} ,foreign_key: "tag_id", source: :tag, through: :taggings

	validates :name, presence: true

	belongs_to :list

	scope :active, -> {where('deleted_at IS NULL')}
	scope :soft_destroyed, -> {where('deleted_at IS NOT NULL')}


	def soft_destroy_taggings
		self.taggings.each {|tagging| tagging.soft_destroy }
	end 

	def restore_taggings
		self.taggings.each {|tagging| tagging.restore }
	end 
end
