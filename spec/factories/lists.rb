FactoryGirl.define do
  factory :list do
    name Faker::Book.title
    deleted_at nil
  end
  factory :soft_deleted_list, class: List do
    name Faker::Book.title
    deleted_at  Time.now
  end

  factory :list_item do 
    list
    name Faker::Book.title
    deleted_at nil
  end 

  factory :soft_deleted_list_item do 
    list
    name Faker::Book.title
    deleted_at Time.now
  end
  
  factory :soft_deleted_list_soft_deleted_list_item do 
    list
    name Faker::Book.title
    deleted_at Time.now
  end

end