# Create a user
User.create(email: "john@john.com", password: "johnjohn", name: "John")

# Create three random food items
Food.create(name: "Apple", measurement_unit: "Piece", price: 0.99, quantity: 10, user_id: User.first.id)
Food.create(name: "Banana", measurement_unit: "Piece", price: 0.50, quantity: 8, user_id: User.first.id)
Food.create(name: "Orange", measurement_unit: "Piece", price: 0.75, quantity: 6, user_id: User.first.id)
