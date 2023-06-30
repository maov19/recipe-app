require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  describe 'validation' do
    let(:user) { User.create(name: 'Sam') }
    let(:food) { Food.create(id: 2, name: 'rice', measurement_unit: 'grams', price: 2, quantity: 3, user_id: user.id) }
    let(:recipe) do
      Recipe.new(id: 1, name: 'NigeriaJollof', preparation_time: 1.0, cooking_time: 2.0, public: true, user_id: user.id,
                 description: 'This is how to create Nigeria jollof')
    end

    subject { RecipeFood.new(quantity: 20, recipe_id: recipe.id, food_id: food.id) }

    before { subject.save }

    it 'should be invalid with nil quantity value' do
      subject.quantity = nil
      expect(subject).to_not be_valid
    end

    it 'should be invalid with quantity value less than or equal to 0' do
      subject.quantity = 0
      expect(subject).to_not be_valid

      subject.quantity = -5
      expect(subject).to_not be_valid
    end
  end
end
