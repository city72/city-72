# Development Environment Setup

## Prerequisites

To setup the application you will need:

 * Postgres with postgis extension
 * Ruby 1.9.3
 * bundler gem
 * bower package manager
 
## Bower instalation

You first need the *npm* package manager installed. Which can be installed by:

Ubuntu:

    sudo add-apt-repository ppa:chris-lea/node.js
    sudo apt-get update
    sudo apt-get install nodejs
    
Os X, using Homebrew

    brew install node
    

Once you have *npm* installed,  to install *bower* you do:

    npm install -g bower 
 
## Postgis Instalation

### Package

On Ubuntu:

    sudo apt-get install python-software-properties
    sudo apt-add-repository ppa:ubuntugis/ppa
    sudo apt-get update
    sudo apt-get install postgresql-9.1-postgis

On OS X, using Homebrew: 

    brew update             # to get the lastest packages
    brew upgrade postgres   # update postgres version (if outdated)
    brew install postgis

## Imagick Instalation

### Package

On Ubuntu:

    sudo apt-get install libdjvulibre-dev libjpeg-dev libtiff-dev libwmf-dev libmagickcore-dev libmagickwand-dev libmagick++-dev

On OS X, using Homebrew:

    brew install imagemagick

### DB Setup

**TODO**: Change this to make it part of a migration!

After db creation for the first time, run the following commands:

	sudo su postgres
		psql ideo_sf72_development
			CREATE EXTENSION postgis;
			alter table geography_columns owner to ideo;
			alter table geometry_columns owner to ideo;
			alter table raster_columns owner to ideo;
			alter table raster_overviews owner to ideo;
			alter table spatial_ref_sys owner to ideo;
