require 'rails_helper'
require_relative 'data_helper'

RSpec.describe 'Foods', type: :system do
  before do
    data
  end
  describe 'GET /foods' do
    it 'displays button to add foods' do
      visit root_path
      fill_in 'Email', with: 'Adarsh.pathak@example.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      click_link 'Foods'
      expect(page).to have_content('Add Food')
    end

    it 'displays created foods' do
      visit root_path
      fill_in 'Email', with: 'Adarsh.pathak@example.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      click_link 'Foods'
      click_link(class: 'add-food-button')
      fill_in 'Name', with: 'Potato'
      fill_in 'Measurement unit', with: 'unit'
      fill_in 'Quantity', with: 10
      fill_in 'Price', with: 5
      find('.btn.btn-primary').click
      expect(page).to have_content('Potato')
      expect(page).to have_content('10')
      expect(page).to have_content('5')
      expect(page).to have_content('unit')
    end
  end

  describe 'GET /foods/new' do
    it 'renders the new food form' do
      visit new_food_path

      expect(page).to have_selector('form')
      expect(page).to have_field('food_name')
      expect(page).to have_field('food_measurement_unit')
      expect(page).to have_field('food_quantity')
      expect(page).to have_field('food_price')
      expect(page).to have_button('Add Food')
    end

    it 'creates a new food' do
      visit root_path
      fill_in 'Email', with: 'Adarsh.pathak@example.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      click_link 'Foods'
      click_link(class: 'add-food-button')
      fill_in 'Name', with: 'Tuna'
      fill_in 'Measurement unit', with: 'unit'
      fill_in 'Quantity', with: 10
      fill_in 'Price', with: 5
      find('.btn.btn-primary').click
      expect(page).to have_content('Food was successfully created.')
      expect(page).to have_content('Tuna')
      expect(page).to have_content('10')
      expect(page).to have_content('5')
      expect(page).to have_content('unit')
    end
  end

  describe 'DELETE /foods/:id' do
    it 'deletes selected food' do
      visit root_path
      fill_in 'Email', with: 'Adarsh.pathak@example.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      click_link 'Foods'
      click_link(class: 'add-food-button')
      fill_in 'Name', with: 'Potato'
      fill_in 'Measurement unit', with: 'unit'
      fill_in 'Quantity', with: 10
      fill_in 'Price', with: 5
      find('.btn.btn-primary').click

      all('button.delete-button').first.click

      expect(page).to have_current_path(foods_path)
      expect(page).to have_content('Food was successfully deleted.')
    end
  end
end
