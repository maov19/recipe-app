RSpec.describe Food, type: :model do
  it "is valid with all required attributes" do
    user = User.create(name: "John", email: "john@example.com", password: "password")
    food = Food.new(name: "Apple", measurement_unit: "piece", price: 2.5, quantity: 10, user: user)
    expect(food).to be_valid
  end

  it "is invalid without a name" do
    food = Food.new(measurement_unit: "piece", price: 2.5, quantity: 10)
    expect(food).not_to be_valid
    expect(food.errors[:name]).to include("can't be blank")
  end

  it "is invalid without a measurement unit" do
    food = Food.new(name: "Apple", price: 2.5, quantity: 10)
    expect(food).not_to be_valid
    expect(food.errors[:measurement_unit]).to include("can't be blank")
  end

  it "is invalid with a negative price" do
    food = Food.new(name: "Apple", measurement_unit: "piece", price: -2.5, quantity: 10)
    expect(food).not_to be_valid
    expect(food.errors[:price]).to include("must be greater than or equal to 0")
  end

  it "is invalid with a negative quantity" do
    food = Food.new(name: "Apple", measurement_unit: "piece", price: 2.5, quantity: -10)
    expect(food).not_to be_valid
    expect(food.errors[:quantity]).to include("must be greater than or equal to 0")
  end

  it "is invalid without a user" do
    food = Food.new(name: "Apple", measurement_unit: "piece", price: 2.5, quantity: 10)
    expect(food).not_to be_valid
    expect(food.errors[:user]).to include("must exist")
  end
end
