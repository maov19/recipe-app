require 'rails_helper'

RSpec.describe "Foods", type: :system do
    describe "GET /foods" do
        it "displays all foods" do
            user = User.create!(name: "John", email: "john@example.com", password: "password")
            user.save
            sign_in user

            food1 = user.foods.create!(name: "Food 1", measurement_unit: "Unit", price: 10, quantity: 5, user: user)
            food2 = user.foods.create!(name: "Food 2", measurement_unit: "Unit", price: 15, quantity: 3, user: user)

            sleep 5

            visit foods_path

            expect(page).to have_content(food1.name)
            expect(page).to have_content(food2.name)
        end
    end

  describe "GET /foods/:id" do
    it "displays a food" do
      user = User.create(name: "John", email: "john@example.com", password: "password")
      food = Food.create(name: "Food 1", measurement_unit: "Unit", price: 10, quantity: 5, user: user)

      visit food_path(food)

      expect(page).to have_content(food.name)
      expect(page).to have_content(food.measurement_unit)
      expect(page).to have_content(food.price)
      expect(page).to have_content(food.quantity)
    end
  end

  describe "GET /foods/new" do
    it "renders the new food form" do
      visit new_food_path

      expect(page).to have_selector("form")
      expect(page).to have_field("food_name")
      expect(page).to have_field("food_measurement_unit")
      expect(page).to have_field("food_quantity")
      expect(page).to have_field("food_price")
      expect(page).to have_button("Add Food")
    end
  end

  describe "POST /foods" do
    it "creates a new food" do
      user = User.create(name: "John", email: "john@example.com", password: "password")

      visit new_food_path

      fill_in "food_name", with: "New Food"
      fill_in "food_measurement_unit", with: "Unit"
      fill_in "food_quantity", with: 10
      fill_in "food_price", with: 20
      click_button "Add Food"

      expect(page).to have_current_path(foods_path)
      expect(page).to have_content("Food was successfully created.")
      expect(Food.last.name).to eq("New Food")
      expect(Food.last.measurement_unit).to eq("Unit")
      expect(Food.last.quantity).to eq(10)
      expect(Food.last.price).to eq(20)
    end

    it "renders the new food form when there are validation errors" do
      user = User.create(name: "John", email: "john@example.com", password: "password")

      visit new_food_path

      fill_in "food_name", with: ""
      fill_in "food_measurement_unit", with: "Unit"
      fill_in "food_quantity", with: 10
      fill_in "food_price", with: 20
      click_button "Add Food"

      expect(page).to have_current_path(foods_path)
      expect(page).to have_content("Food not created.")
      expect(page).to have_content("Name can't be blank")
      expect(Food.count).to eq(0)
    end
  end

  describe "DELETE /foods/:id" do
    it "deletes a food" do
      user = User.create(name: "John", email: "john@example.com", password: "password")
      food = Food.create(name: "Food 1", measurement_unit: "Unit", price: 10.0, quantity: 5, user: user)

      visit foods_path

      expect(page).to have_content(food.name)

      click_button "Delete"

      expect(page).to have_current_path(foods_path)
      expect(page).to have_content("Food was successfully deleted.")
      expect(page).not_to have_content(food.name)
      expect(Food.count).to eq(0)
    end
  end
end
