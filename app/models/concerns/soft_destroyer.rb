module SoftDestroyer

		def soft_destroy
			self.update(deleted_at: Time.now)
			run_callbacks :soft_destroy do 
			end unless self.class.name == "Tagging"
		end
	
		def restore
			self.update(deleted_at: nil)
			run_callbacks :restore do
			end unless self.class.name == "Tagging"
		end
end 