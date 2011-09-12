SUMMARY
-------

Rails Dog Radio Theme is a standalone theme for Spree Commerce version 0.70.0 or later.

This theme is now being used as the base theme for Spree demo store:

* [View Demo - http://demo.spreecommerce.com](http://demo.spreecommerce.com)
* [View Demo Repo - https://github.com/spree/demo](https://github.com/spree/demo)


This theme also currently supports (and will restyle the following
extensions if installed):

* [spree_social - https://github.com/spree/spree_social](https://github.com/spree/spree_social)
* [spree_wishlist - https://github.com/spree/spree_wishlist](https://github.com/spree/spree_wishlist)
* [spree_recently_viewed - https://github.com/spree/spree_recently_viewed](https://github.com/spree/spree_recently_viewed)
* [spree_related_products - https://github.com/spree/spree_related_products](https://github.com/spree/spree_related_products)
* [spree_paypal_express -  https://github.com/spree/spree_paypal_express](https://github.com/spree/spree_paypal_express)


INSTALLATION
------------

Add the following line to your Gemfile:

    gem 'spree_rdr_theme', :git => 'git://github.com/spree/spree_rdr_theme.git'

NOTE: It's important that you add this line at the bottom of the Gemfile, or at least AFTER any other extension/engine/gem that you'd like to theme (i.e. Spree)

Run bunlder:

    $ bundle install

Install assets:

    $ rails g spree_rdr_theme:install

Optional: Clear out precompiled assets (required for install in sandbox):

    $ rake assets:clean

