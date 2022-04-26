
# Inventory App
A rails web app to manage inventory items in multiple warehouses. Main features in this app are the CRUD actions for `Item` and `Warehouse` and add Items in different Warehouses.

## Features
- CRUD for `Item` model
- CRUD for `Warehouse` model
- Add Items in different Warehouses with a custom quantity

## Running the Project

### Replit
[Replit repo](https://replit.com/@RabihMteyrek/inventory-app/), to run just click the green run button at the top.
To reset the database please run `rails db:reset`

### Locally
1. Clone repo
2. Run `bundle install` to install dependencies
3. Run `rails db:migrate` to generate the database
4. Run `rails db:seed` to add seeds to the db
5. Run `rails s` to run the server

A server should now be running on [http://localhost:3000](http://localhost:3000)

## Tests
The project includes tests for the models and controllers of `Item`, `Warehouse` and `WarehouseItem`.

Tests can be ran for the whole project using
``` bash
rails test
```
To run specific tests, it can be specified by folder or file like so

```bash
# Test all controllers
rails test test/controllers

# Test all models
rails test test/models

# Test the Item controller
rails test test/controllers/items_controller_test.rb

# Test the Item model
rails test test/models/item_test.rb
```


## App Pages
| Path             | Description                                                       |
| :--------------- | :---------------------------------------------------------------- |
| `/`              | **Root path**                                                     |
| `/items`         | **Display all items**, add, edit and delete.                      |
| `/items/:id`     | **Show specific item**, with location in different warehouses.    |
| `/warehouses`    | **Show all warehouses**, add, edit and delete.                    |
| `/warehouses/:id`| **Show specific warehouse**, add item with quantity to warehouse. |

## Database
Database consists of three tables, two model tables and one joint table.
![database schema](app/assets/images/db.png)
