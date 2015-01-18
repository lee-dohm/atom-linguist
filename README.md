# Atom Linguist

A language classifier for [Atom][atom] based on GitHub's [linguist][linguist].

This package is intended to replace the built-in Atom language classification by file extension or first line.

## Usage

```coffee
Linguist = require 'atom-linguist'

Linguist.detect('foo.coffee')     # => 'CoffeeScript'
```

## Copyright

Copyright &copy; 2015 by [Lee Dohm](http://www.lee-dohm.com) and [Lifted Studios](http://www.liftedstudios.com). See [LICENSE][license] for details.

[atom]: https://atom.io
[license]: https://github.com/lee-dohm/atom-linguist/blob/master/LICENSE.md
[linguist]: https://github.com/github/linguist
