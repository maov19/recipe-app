require 'rails_helper'
require_relative 'data_helper'

RSpec.describe 'recipes', type: :system do
  before do
    data
  end

  it 'Recipes Page should have Button to ADD recipe' do
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
  end

  it 'contains preparation time' do
    visit root_path
    fill_in 'Email', with: 'Adarsh.pathak@example.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
    click_link 'Recipes'
    click_link 'Dosa'
    expect(page).to have_content('Preparation time: 2.0 hours')
  end

  it 'contains cooking time' do
    visit root_path
    fill_in 'Email', with: 'Adarsh.pathak@example.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
    click_link 'Recipes'
    click_link 'Dosa'
    expect(page).to have_content('Cooking time: 2.0 hours')
  end

  it 'should genrate the shoping list' do
    visit root_path
    fill_in 'Email', with: 'Adarsh.pathak@example.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
    click_link 'Recipes'
    click_link 'juice'
    click_link 'Generate shopping list'
    expect(page).to have_content('orange')
  end

  it 'Recipe with publick set to false should not be visible in public recipe page' do
    visit root_path
    fill_in 'Email', with: 'Stephen.Adom@example.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
    expect(page).not_to have_content('paratha')
    expect(page).not_to have_content('soda')
    expect(page).not_to have_content('roka')
  end

  it 'Public Recipe should be visible in public recipe page' do
    visit root_path
    fill_in 'Email', with: 'Stephen.Adom@example.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
    expect(page).to have_content('juice')
    expect(page).to have_content('Adarsh')
    expect(page).to have_content('Dosa')
    expect(page).to have_content('Icecream')
    expect(page).to have_content('Stephen')
  end

  it 'Author of Public Recipe should be visible' do
    visit root_path
    fill_in 'Email', with: 'Stephen.Adom@example.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
    expect(page).to have_content('By: Adarsh Pathak')
    expect(page).to have_content('By: Stephen Adom')
  end

  it 'User can remove Own Recipe' do
    visit root_path
    fill_in 'Email', with: 'Stephen.Adom@example.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
    click_link 'Recipes'
    first('button', text: 'Remove').click
    expect(page).to have_content('Recipe was successfully destroyed.')
  end

  it 'When user click a recipe name in the public recipe page it should redirect the user to the recipe show page' do
    visit root_path
    fill_in 'Email', with: 'Stephen.Adom@example.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
    click_link 'Icecream'
    expect(page).to have_content('Icecream')
  end
end
