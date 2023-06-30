npx stylelint "**/*.{css,scss}"

### Project requirements
https://github.com/microverseinc/curriculum-rails/blob/main/recipe-app/buisness_requirements.md

You should follow the layout of the wireframes provided. You should personalize the rest of the design including colors, typographies, spacings, etc.
## Login page and registration page:
Should be built with Devise.
## Food list (only for a group that has less than 3 members):
Should display a list of food added by the logged-in user as in the wireframe (display also quantity of a given food).
Should lead to a form that allows users to add new food.
## Recipes list:
Should display a list of recipes created by the logged-in user as in the wireframe.
Should lead to recipe details.
If the user is the owner of the recipe, should allow the user to delete it.
## Public recipe list:
Should display a list of all public recipes ordered by newest as in the wireframe.
Should lead to recipe details.
## Recipe details:
Should display a toggle button that allows for a recipe to be made public or private.
If the recipe is public or the user is the owner of the recipe, should display the recipe details as in the wireframe.
If the user is the owner of the recipe, should lead to the form that allows the user to add new food.
## General shopping list view (only for a group that has less than 3 members):
Should show the list of food that is missing for all recipes of the logged-in user (compare the list of food for all recipes with the general food list of that user).
Should count the total food items and total price of the missing food.
## Make sure there are no N+1 queries happening.
## Create a navigation menu that allows users to open all of the pages you created.
## Write unit and integration tests

If your team has 3 members these are requirements; otherwise, they are additional requirements
Inventories list:
Should display a list of inventories created by the logged-in user as in the wireframe.
Should lead to inventory details.
If the user is the owner of the inventory, should allow to delete it.
Inventory details:
Should display the inventory details as in the wireframe.
Should lead to a form that allows users to add new food.
Recipe details:
Should have a modal to choose an inventory to create a shopping list with, as in the wireframe.
Inventory shopping list:
Should show the list of food that is missing by comparing the food in the recipe with the food in the inventory.
Should count the total food items and total price of the missing food.

### ERD 
https://chat.openai.com/share/9c1c1844-30ef-4166-856b-56b5589edb35

                                            -------------
                                            |   Food    |
                                            -------------
                                            |   Name    |
                                            |   Meas.un |-|--|
                                            |   Price   |    |
                                            |   Quantity|    |
                |--------------------------<|   User ID |    |
                -                           -------------    |
                |                                            |
            -------------                                    |
            |   User    |                                    |
            -------------                                    |
        --|-|   Name    |                                    |
        |    -------------                                   |   
        |                                                    |
        |                                                    |
        |    -------------                ----------------   |
        |    |   Recipe  |                | Recipe food  |   |
        |    -------------                ----------------   |
        |    |  Name     |                | Quantity     |   |
        |    |  Prep time|-|-------------<| Recipe ID    |   |
        |    |  Cook time|                | Food ID      |>--|
        |    |  Descript |                ----------------
        |    |  Public   |
        ----<|  User ID  |
             -------------