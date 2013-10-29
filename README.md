# Development Environment Setup

## Prerequisites

To setup the application you will need:

 * Postgres
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
 
## Imagick Instalation

### Package

On Ubuntu:

    sudo apt-get install libdjvulibre-dev libjpeg-dev libtiff-dev libwmf-dev libmagickcore-dev libmagickwand-dev libmagick++-dev

On OS X, using Homebrew:

    brew install imagemagick