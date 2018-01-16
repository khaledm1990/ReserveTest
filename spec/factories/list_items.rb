FactoryGirl.define do
  factory :list_item do
    list
    name Faker::Book.title

    factory :soft_deleted_list_item do 
      deleted_at  Time.now
    end 

    factory :list_item_with_tags do 
      after(:create) do |list_item|
        create(:tag, list_item: list_item)
      end 
    end
  end
end
