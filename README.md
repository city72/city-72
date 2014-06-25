Included here are:

  * [Production Deployment](#production_deployment)
  * [Development Environment Setup](#development-environment-setup)

# Production Deployment

## Prerequisites

* Git [Installing Git](http://git-scm.com/book/en/Getting-Started-Installing-Git)

### Step By Step Guide

#### Obtain a copy of the application

Using git, clone the github repository to obtain a local copy on your computer.

```sh
  $ git clone git@github.com:zauberlabs/ideo-city-72.git
```

This will create a folder with name `ideo-city-72` to be called within this guide your "project folder".

#### Setup Heroku

Follow these steps:

  1. Create a [heroku account](http://www.heroku.com) (if you don't have any)
  2. Install heroku toolbelt on your computer & login
      * Step 2 and 3 of the [heroku quickstart guide](https://devcenter.heroku.com/articles/quickstart)
  3. Add your credit card information to your heroku account.


#### Application configuration on heroku

First, go to your heroku account and create an application to be used for the project. When asked for the number of `web dynos` to used in your application. set to 2 dynos. This is the recommened setting for your application.

Then, go to you project folder, and then run the following commands:

##### Configure the heroku app for your project

```sh
  $ git remote add heroku git@heroku.com:YOURAPPNAME.git
```

(In your heroku account, choose your app's settings, and you will get the Git URL, from the info section)

##### Add the add-on for the database

```sh
  $ heroku addons:add heroku-postgresql:standard-yanari -a YOURAPPNAME
```

This addon has a monthly cost of 50$ usd. It's used to have a database in your application

##### Add pg-backups add-on (db backups)

```sh
  $ heroku addons:add pgbackups:auto-week -a YOURAPPNAME
```

This add on is free. It's used to have backups of your database.

##### Add sengrid add-on

```sh
  $ heroku addons:add sendgrid -a YOURAPPNAME
```

This add on is free. It's used to send emails from your application.

##### Add newRelic add-on

```sh
heroku addons:add newrelic:stark -a YOURAPPNAME
```

This add on is free. It's used to monitor your application performance

##### Add cloudinary add-on

```sh
heroku addons:add cloudinary -a YOURAPPNAME
```

This add on is free. It's used to store and host images in your application

##### Configure the recover password host redirection (example: YOURAPPNAME.herokuapp.com)

```sh
heroku config:set EMAIL_REDIRECT_HOST=YOURAPPNAME.herokuapp.com
```

This variable, configures the domain to be used within the emails sent from your application. You should configure it to use the domain you have. 

##### Configure the admin data

Change the following first lines in the db/seeds.rb file

```sh
adminEmail = 'YOUR MAIL'
adminPassword = 'YOUR PASSWORD'
```

This is done to setup the email and credentials used to enter the administration CMS of your application.

##### Deploy

```sh
git push heroku master
```

##### Run migrations and Populate the database
```sh
heroku run rake db:setup
```

# Development Environment Setup

## Prerequisites

To setup the application you will need:

* PostgreSQL database
* Ruby 1.9.3-p448
* Bundler gem
* Bower
* Imagick

### PostgreSQL installation

#### Linux
```sh
sudo apt-get -y install postgresql
```

#### Mac OS X

[Install PostgreSQL 9 on OSX](http://russbrooks.com/2010/11/25/install-postgresql-9-on-os-x)


### Ruby Installation

#### Rbenv

To install ruby, it is necessary to have *rbenv* installed. This can be installed following the steps described in [rbenv's Github Repository](https://github.com/sstephenson/rbenv), in the [Installation Section](https://github.com/sstephenson/rbenv#installation).

#### Ruby 1.9.3-p448

When rbenv is already installed, go to the project's root folder, and run the following command
```sh
rbenv install
```

### Bundler gem
In order the manage the project dependencies, it is necessary to have installed *bundler*.
```sh
gem install bundler
```

### Bower
To manage the client-side js dependencies, it is necessary to have installed *bower*. *Bower* depends on *node.js*, so if it is not installed yet, install it with *nvm*, following these instructions: [NVM - Installation guide](https://github.com/creationix/nvm#installation).

Having *node.js* installed, run the following command to install *bower*:
```sh
npm install -g bower
```

### Imagick

Linux:

```sh
sudo apt-get install libdjvulibre-dev libjpeg-dev libtiff-dev libwmf-dev libmagickcore-dev libmagickwand-dev libmagick++-dev
```

On OS X:

```sh
brew install imagemagick
```

## Development environment

Before running the app, the following steps should be performed.
* Create the database user for the application
* Install the application dependencies
* Create the database
* Download the client-side dependecies

### Create the database user for the application

```sh
createuser -P -s city72
```
Assign the word *city72* as password too.

> Linux users should run the above command as postgres user (`sudo su postgres`).

### Install the application dependencies

```sh
bundle install
```

### Create the database

```sh
bundle exec rake db:setup
```

### Download the client-side dependencies

```sh
bower install
```

## Run the application locally
With all the prerequisites and the development environment ready. Just run the app, with the following command:

```sh
bundle exec rails s
```

