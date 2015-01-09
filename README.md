# Atom Linguist

A language classifier for Atom based on GitHub's [linguist][linguist].

## Usage

```coffee
fs = require 'fs'

Linguist = require 'atom-linguist'

Linguist.detect(fs.readFileSync('foo.coffee')).name     # => 'CoffeeScript'
```

## Copyright

Copyright &copy; 2014 by [Lee Dohm](http://www.lee-dohm.com) and [Lifted Studios](http://www.liftedstudios.com). See [LICENSE][license] for details.

[license]: https://github.com/lee-dohm/atom-linguist/blob/master/LICENSE.md
[linguist]: https://github.com/github/linguist
