FactoryGirl.define do
  factory :tagging do
    list_item
    tag
    factory :soft_deleted_tagging do 
      deleted_at  Time.now
    end 
  end
end
