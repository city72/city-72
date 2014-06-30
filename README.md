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
  $ git clone git@github.com:city72/city-72.git
```

This will create a folder named `city-72`. In this guide, we refer to this folder as your "project folder".

#### Setup Heroku

Follow these steps:

  1. Create a [heroku account](http://www.heroku.com) (if you don't already have one)
  2. Install the Heroku Toolbelt on your computer & login
      * Step 2 and 3 of the [heroku quickstart guide](https://devcenter.heroku.com/articles/quickstart)
  3. Add your credit card information to your heroku account. If you are just testing the site you can choose free options below. NOTE: The free version of the site on Heroku is not recommended for the public launch of your City72 site that may experience a high volume of traffic during an emergency. 


#### Configure an application on Heroku with 2 dynos

First, go to your heroku account and create an application to be used for the project. When asked for the number of `web dynos` to be used in your application select 2. Two dynos is the recommended setting for your application in order to keep the app reliable and responsive to traffic. 

For testing purposes, you can choose an application with no extra dynos. NOTE: Sites with no extra dynos "go to sleep" and can be slow to wake up. So, this free level of service is not appropriate for the public launch of your site. For the full launch of your site, create an application with at least two dynos.

#### Configure the Heroku App for your project

Go to you project folder, and run the following command:

```sh
  $ git remote add heroku git@heroku.com:YOURAPPNAME.git
```

(In your heroku account, choose your app's settings, and you will get the Git URL, from the info section)

#### Install add-ons - Production (adds $100/month)

If you would prefer to test the site for free use the add-on instructions in the next section. NOTE: If you know you will launch this site to the public use these paid add-ons.

**postgresql:** This add-on has cost of $50 per month. It's is the database in your application.

```sh
  $ heroku addons:add heroku-postgresql:standard-yanari -a YOURAPPNAME
```


**pg-backups:** This add-on is free. It creates backups of your database.

```sh
  $ heroku addons:add pgbackups:auto-week -a YOURAPPNAME
```

**sengrid:** This add-on is free. It's used to send emails from your application.

```sh
  $ heroku addons:add sendgrid -a YOURAPPNAME
```

**newrelic:** This add-on is free. It monitors your application performance

```sh
  $ heroku addons:add newrelic:stark -a YOURAPPNAME
```

**cloudinary:** This add-on has a cost of $50 per month. It is used to store and host images in your application.

```sh
 $ heroku addons:add cloudinary:bronze -a YOURAPPNAME
```


#### Install add-ons - Testing Site (free)

If you are using the paid add-ons above, skip this section.

**postgresql:** This version of the add on is free. It's is used in order to have a database in your application. This version is not robust enough for normal amounts of web traffic. Only use the free version for testing purposes.


```sh
  $ heroku addons:add heroku-postgresql -a YOURAPPNAME
```


**pg-backups:** This add-on is free. It creates backups of your database.

```sh
  $ heroku addons:add pgbackups:auto-week -a YOURAPPNAME
```

**sengrid:** This add-on is free. It's used to send emails from your application.

```sh
  $ heroku addons:add sendgrid -a YOURAPPNAME
```

**newrelic:** This add-on is free. It monitors your application performance

```sh
  $ heroku addons:add newrelic:stark -a YOURAPPNAME
```

**cloudinary:** This version of the add-on is free. It is used to store and host images in your application. Only use the free version of this add-on for testing purposes


```sh
 $ heroku addons:add cloudinary -a YOURAPPNAME
```



#### Configure the recover password host redirection (example: YOURAPPNAME.herokuapp.com)

```sh
 $ heroku config:set EMAIL_REDIRECT_HOST=YOURAPPNAME.herokuapp.com
```

This variable, configures the domain to be used within the emails sent from your application. You should configure it to use the domain you have.


#### Deploy

Finally you are now able to do a deploy of the application.

Do:
```sh
 $ git ci -am 'Admin credentials'
 $ git push heroku master
 $ heroku run bundle exec rake db:setup            # this creates database schema & prepopulates basic data
 $ heroku run bundle exec rake city72:populate     # this populates data to the database
```

Now you should be able to enter you application.

  * Go to `http://YOURAPPNAME.herokuapp.com/` to navigate the application
  * Go to `http://YOURAPPNAME.herokuapp.com/cms` to configure the application
  
#### FINAL STEP: Update your username and password via the Content Editor

The application was installed with a default username and password (these are set in the db/seeds.rb file). To login to your new site's content editor go to your app and login

`http://YOURAPPNAME.herokuapp.com/cms`

The default username and password are:

admin@example.com

password

Once you login change the email to your email address then change the password.




---
  

# Development Environment Setup

In most cases you will not need to setup a development environment for this application. The only reason to go through the following steps would be if you wanted to customize your site beyond what is set with the Content Editor such as some of the hard-coded text of the site.

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
