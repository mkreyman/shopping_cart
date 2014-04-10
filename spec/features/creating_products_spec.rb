require 'spec_helper'

feature 'Product Management' do
  scenario 'User creates a new product' do
    #visit '/products/new'
    visit new_product_path

    fill_in 'Name', with: 'Product'
    fill_in 'Description', with: 'Some product description'
    fill_in 'Image URL', with: 'https://github-images.s3.amazonaws.com/help/repository/https-url-clone.png'
    fill_in 'Price', with: 29.99

    click_on 'Create'

    expect(page).to have_content('Product was successfully created.')
  end

  scenario 'User edits an existing product' do
    @product = FactoryGirl.create(:product)
    visit "/products/#{@product.id}/edit"

    fill_in 'Name', with: 'New Name'
    fill_in 'Description', with: 'Some new description'
    fill_in 'Image URL', with: 'https://github-images.s3.amazonaws.com/help/repository/https-url-clone.png'
    fill_in 'Price', with: '29.99'

    click_button 'Update Product'

    expect(page).to have_text('Product was successfully updated.')
  end

  scenario 'User views a product' do
    @product = FactoryGirl.create(:product)
    visit "/products/#{@product.id}"

    expect(page).to have_text("#{@product.name}")
  end

  scenario 'User views all products' do
    @product1 = FactoryGirl.create(:product)
    @product2 = FactoryGirl.create(:product)
    @product3 = FactoryGirl.create(:product)
    visit "/products"

    expect(page).to have_text("#{@product1.name}")
    expect(page).to have_text("#{@product2.name}")
    expect(page).to have_text("#{@product3.name}")
  end

  scenario 'User deletes a product' do
    @product = FactoryGirl.create(:product)
    visit "/products"

    click_on 'Destroy'

    expect(page).to have_text('Product was deleted.')
  end

end