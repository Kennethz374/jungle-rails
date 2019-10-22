require 'rails_helper'

RSpec.feature "test that users can navigate from the home page to the product detail page by clicking on a product", type: :feature, js: true do
    before :each do
      @category = Category.create! name: 'Apparel'
  
      10.times do |n|
        @category.products.create!(
          name:  Faker::Hipster.sentence(3),
          description: Faker::Hipster.paragraph(4),
          image: open_asset('apparel1.jpg'),
          quantity: 10,
          price: 64.99
        )
      end
    end

  scenario "They see specific product page when click on it on home page" do
    visit root_path
    first('article.product').find_link('Details').click
    save_screenshot
    expect(page).to have_content 'Name', "Description", "Quantity", "Price"
    expect(page).to have_css 'img.main-img'
  end

end
