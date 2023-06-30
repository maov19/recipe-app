require 'rails_helper'
require_relative 'data_helper'

RSpec.describe "ShoppingLists GET /shopping_lists", type: :system do
  before do
    data
  end

  it "displays the shopping list header" do
    visit root_path
    fill_in 'Email', with: 'Adarsh.pathak@example.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
    click_link 'Recipes'
    click_link 'Add recipe'
    fill_in 'Name', with: 'Pratha'
    fill_in 'Description', with: 'Anything we want'
    fill_in 'Cooking time', with: 2
    fill_in 'Preparation time', with: 2
    click_button 'Create Recipe'
    expect(page).to have_content('Pratha')
    expect(page).to have_content('2')
    expect(page).to have_content('Add ingredient')
    expect(page).to have_content('Generate shopping list')

    click_link 'Generate shopping list'
    expect(page).to have_content('Shopping List')
    expect(page).to have_content('Number of items in the shopping list:')
    expect(page).to have_content('Total price:')
  end

  it "displays the right quantity, amount and price of items" do
    visit root_path
    fill_in 'Email', with: 'Adarsh.pathak@example.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
    click_link 'Recipes'
    click_link 'Add recipe'
    fill_in 'Name', with: 'Pratha'
    fill_in 'Description', with: 'Anything we want'
    fill_in 'Cooking time', with: 2
    fill_in 'Preparation time', with: 2
    click_button 'Create Recipe'
    expect(page).to have_content('Pratha')
    expect(page).to have_content('2')
    expect(page).to have_content('Add ingredient')
    expect(page).to have_content('Generate shopping list')
  
    click_link 'Generate shopping list'
    expect(page).to have_content('Shopping List')
    expect(page).to have_content('Number of items in the shopping list: 1')
    expect(page).to have_content('Total price: $100.0')
    expect(page).to have_content('10 Kilograms')
  
  end
end
