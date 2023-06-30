class AddNameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string

# the references will be added in another migration, after the foods and recipes are created
    # add_reference :foods, :user, null: false, foreign_key: true
    # add_reference :recipes, :user, null: false, foreign_key: true
  end
end
