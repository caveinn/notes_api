# Notes Api

Notes API allows users to store notes and share them among themselves. It has a structure for a school and class to enable more structured sharing.

## Requirements

#### Ruby

This application uses Ruby version `2.5.0`. To install use `rvm` or `rbenv`.

* RVM

        rvm install 2.5.0
        rvm use 2.5.0
    - To set Ruby `2.5.0` as the default Ruby version for your computer, run 
        
            rvm use 2.5.0 --default

* Rbenv

        rbenv install 2.5.0
    - To switch to `2.5.0` temporarily for this project, use 
            
            rbenv local 2.5.0
    
    - To use this version as the default Ruby version for your global environment, use 
            
            rbenv global 2.5.0

#### Bundler

Bundler provides a consistent environment for Ruby projects by tracking and installing the exact gems and versions that are needed

To install:

        gem install bundler

#### Rails

This applications uses one of the latest versions of rails. You will need to upgrade if you don't already have it istalled. The rails version being used is `rails 6.0.0`.

To install:

        gem install rails

#### PostgreSQL

This application makes use of the postgres database. For local development, you need to install it.
To install postgres using `brew`:

        brew install postgresql
    
For extra information on how to configure, make use of this [tutorial](https://www.codementor.io/engineerapart/getting-started-with-postgresql-on-mac-osx-are8jcopb).

To install postgres using a client make use of this application - [Postgres.app](https://postgresapp.com/)

These are just recommendations, feel free to look up more ways of installing and configuring postgresSQL.


## Installation

To get up and running with the project locally, follow the following steps.

* Clone the app

        git clone https://github.com/caveinn/notes_api.git

* Move into the directory and install all the requirements.

    ```bash
    cd notes_api/
    ```
* Configuration  
    Install the gems by running `bundle i`
    Create an env file following the .env_example

* Setup the database
    Run:

        rails db:setup
        rails db:migrate

* Run the application 

        rails s

    Now visit [localhost:3000](http://localhost:3000)


## Contributors
Kevin Nzioka
Mariam Natukunda
