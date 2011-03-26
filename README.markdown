How to use
==========

    # currently used for one-way conversion, more features soon
	gregorian = Time.now # => 2011-03-26 00:59:51 -0400
	hijri = gregorian.to_hijri # => 1432-04-22 00:59:51 -04:00
	# "There is a small probability of one day error."

How to install
==============

For ruby, just install the gem and require.

    $ gem install hijri_gem
    $ irb
    $ irb(main):001:0> require 'rubygems'
    $ irb(main):002:0> require 'hijri_gem'

For Rails 3 add the following line to your bundle and install.

    gem 'hijri_gem'

Todo
----

* Tests
* Words