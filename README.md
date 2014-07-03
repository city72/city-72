Included in this guide:

  * [Production Deployment](#production_deployment)
  * [Development Environment Setup](#development-environment-setup)

# Production Deployment 

## Prerequisites

* **Git**—for more information, read [Getting Started with Git](http://git-scm.com/book/en/Getting-Started-Installing-Git).

### Step By Step Guide

#### Obtain a copy of the application

Clone the code to your computer.
The command you type into your shell application (Terminal on the Mac) will be:

```sh
$ git clone https://github.com/city72/city-72.git
```

This will create a directory named `city-72`.

#### Setup Heroku

Follow these steps:

  1. Create a [heroku account](http://www.heroku.com) (if you don't already have one)
  2. Install the Heroku Toolbelt on your computer & login
      * Step 2 and 3 of the [heroku quickstart guide](https://devcenter.heroku.com/articles/quickstart)
  3. Add your credit card information to your heroku account. This is required in order to verify your account so that you can use add-ons. 
  4. You may need to add a public key to your heroku account. For instructions, read about [adding keys](https://devcenter.heroku.com/articles/keys) on Heroku.

#### Configure an application on Heroku with 2 dynos

First, go to your heroku account and create an application to be used for the project. When asked for the number of `web dynos` to be used in your application select `2`. Two dynos is the recommended setting for your application in order to keep the app reliable and responsive to traffic. 

For testing purposes, you can choose an application with no extra dynos. NOTE: Sites with no extra dynos "go to sleep" and can be slow to wake up. So, this free level of service is not appropriate for the public launch of your site. 

#### Configure the Heroku App for your project

Go to the city-72 directory that was created when you cloned from Github, and run the following command:

```sh
  $ git remote add heroku git@heroku.com:YOURAPPNAME.git
```

(In your heroku account, choose your app's settings, and you will get the Git URL, from the info section)

#### Install add-ons

Your Heroku app will need the following add-ons. They are all free add-ons. You may wish to upgrade the database or cloudinary to a paid level if you anticipate large volumes of traffic to your site. 

**PostgreSQL** is the database for your application.
 
 ```sh
   $ heroku addons:add heroku-postgresql -a YOURAPPNAME
```

**PG Backups** creates backups of your database.

```sh
  $ heroku addons:add pgbackups:auto-week -a YOURAPPNAME
```

**SendGrid** sends emails from your application (e.g. the forgot password email).

```sh
  $ heroku addons:add sendgrid -a YOURAPPNAME
```

**NewRelic** monitors your application performance

```sh
  $ heroku addons:add newrelic:stark -a YOURAPPNAME
```

**Cloudinary** resizes, crops and then stores the images in your application.

 
```sh
  $ heroku addons:add cloudinary -a YOURAPPNAME
```



#### Configure the recover password host redirection:

```sh
 $ heroku config:set EMAIL_REDIRECT_HOST=YOURAPPNAME.herokuapp.com
```

This variable, configures the domain to be used within the emails sent from your application. You should configure it to use the domain you have.


#### Deploy

Finally, you are able to deploy the application.

Do:
```sh
 $ git push heroku master
 $ heroku run bundle exec rake db:setup            # this creates database schema & prepopulates basic data
 $ heroku run bundle exec rake city72:populate     # this populates data to the database
```

Now you should be able to enter you application.

Go to `http://YOURAPPNAME.herokuapp.com/` to see your new City72 site.

  
#### FINAL STEP: Update your username and password via the Content Editor

Your site was installed with a default username and password (these are set in the db/seeds.rb file). Go to your app and login

`http://YOURAPPNAME.herokuapp.com/cms`

The default username and password are:

`admin@example.com`

`password`

Once you login, use the Admin menu in the navigation to change the email to your email address. Then you will need to change the password to a strong password that only you know.




---
  

# Development Environment Setup

In most cases you will not need to setup a development environment for this application. The only reason to go through the following steps would be if you wanted to customize your site beyond what you can set with the Content Editor.

## Prerequisites

To setup the application you will need:

* PostgreSQL database
* Ruby 1.9.3-p448
* Bundler gem
* Bower


### PostgreSQL installation

#### Linux

    $ sudo apt-get -y install postgresql

#### Mac OS X

    $ brew install postgresql

### Ruby Installation

#### Rbenv

To install ruby, it is necessary to have *rbenv* installed. This can be installed following the steps described in [rbenv's Github Repository](https://github.com/sstephenson/rbenv), in the [Installation Section](https://github.com/sstephenson/rbenv#installation).

#### Ruby 1.9.3-p448

When rbenv is already installed, go to the project's root folder, and run the following command

```sh
 $ rbenv install
```

### Bundler gem
In order the manage the project dependencies, it is necessary to have installed *bundler*.

```sh
 $ gem install bundler
```

### Bower
To manage the client-side js dependencies, it is necessary to have installed *bower*. *Bower* depends on *node.js*, so if it is not installed yet, install it with *nvm*, following these instructions: [NVM - Installation guide](https://github.com/creationix/nvm#installation).

Having *node.js* installed, run the following command to install *bower*:

```sh
npm install -g bower
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

Linux users should run the above command as postgres user (`sudo su postgres`).

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

## Open your application on Port 3000

Go to your browser and open 

```sh
localhost:3000
```

