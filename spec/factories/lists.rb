FactoryGirl.define do
  factory :list do
    name Faker::Book.title
    factory :list_with_list_items do 
      after(:create) do |list|
        create(:list_item, list: list)
      end 
    end 

    factory :second_list do
      name Faker::Book.title
    end

    factory :invalid_list do
      name nil
    end

    factory :soft_deleted_list do
      name Faker::Book.title
      deleted_at  Time.now
    end

  end
end