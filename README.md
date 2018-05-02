# On Running <> Salesforce Use Case

## Setup:

* Clone or download repo.
* Navigate into project
* `bundle install` to install ruby dependancies
* `yarn install` to install node dependancies
* `rake db:migrate` to run all db migrations (sqlite3)
* `gem install foremen` ensure that you have foreman installed
* `foreman start -f Procfile.dev` to start bundle server
* open `localhost:3000` in your browser

## Migrate Salesforce Data:
* `config/initializers/salesforce.rb` ensure credentials (Host: test.salesforce.com // API Version; '41.0')
* `rails salesforce:dealers:sync` to create and update accounts from Salesforce
* `rails salesforce:dealers:delete` to delete local accounts with those from Salesforce with isDeleted=true

## How to run the test suite:
* `rspec spec` to run all tests

## Files you should review;
* `app/services/salesforce/sync_dealers.rb` a Service which creates and updates salesforce dealers
* `app/services/salesforce/delete_dealers.rb` a Service which deletes salesforce dealers with isDeleted=true
* `app/javascript/bundles/Dealers/components/*` ReactJS WebApp to list dealers on a map
