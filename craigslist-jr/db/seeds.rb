require 'faker'

15.times {
  Category.create!({
    name: Faker::Commerce.department
    })
}

200.times {
  Article.create!({
    title: Faker::Commerce.product_name,
    body: Faker::Hipster.paragraph(5),
    email: Faker::Internet.email,
    price: Faker::Number.decimal(2, 2),
    category_id: rand(25)
    })
}
