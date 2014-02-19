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
createuser -P -s ideo
```
Assign the word *ideo* as password too.

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
