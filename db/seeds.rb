# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Owner.create!(name: "khaled")


5.times {
    Owner.create!(name: Faker::Name.unique.first_name)
}

Owner.all.each {
    |owner| 3.times{ owner.articles.create!(name: Faker::Book.title, description: Faker::Lorem.paragraph(2, true),price: Faker::Number.number(2), currency: "$") }
}

10.times {
    Tag.create!(name: Faker::Types.string)
}

10.times {
    List.create!(name: Faker::Book.title)
}

List.all.each {
    |list| 1.times{ list.list_items.create!(name: Faker::Book.title) }
}

ListItem.all.each { |list_item|
 3.times {
     list_item.taggings.create!(list_item_id: list_item.id, tag_id: Tag.ids[rand(Tag.count)] )
    }
}