Morguefile api wrapper

Free images without attribution / license fees.

Install
=======

```Bash
gem install morguefile
```

Usage
=====

```Ruby
# get key and secret from http://www.morguefile.com/developer
Morguefile.key = 'xxx' # otherwise tries to read ENV['MORGUEFILE_KEY']
Morguefile.secret = 'xxx' # otherwise tries to read ENV['MORGUEFILE_SECRET']
if url = Morguefile.find_image('cats')
  ... store it ... 
end
```

TODO
====
 - Missing lots of conveniance functions like ordering/pagination etc ... please open a PR if you need them.
 - request signing might not work ... no way to verify since the api works fine without auth

Author
======
[Michael Grosser](http://grosser.it)<br/>
michael@grosser.it<br/>
License: MIT<br/>
[![Build Status](https://travis-ci.org/grosser/morguefile.png)](https://travis-ci.org/grosser/morguefile)
