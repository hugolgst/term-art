<p align="center"><img width=12.5% src="https://i.imgur.com/ygtsUyd.png"></p>
<p align="center"><img width=60% src="https://i.imgur.com/Pd9buxE.png"></p>

<p align="center">
  <img src="https://badge.fury.io/rb/term-art.svg" alt="Gem version" />
  <img src="https://img.shields.io/gem/dt/term-art.svg" alt="Downloads" />
  <img src="https://img.shields.io/github/license/AnanaGame/term-art.svg" alt="License" />
</p>

<p align="center">
  <a href="#how-to-use">How To Use</a> •
  <a href="#documentation">Documentation</a> •
  <a href="#example">Example</a>
</p>

# How to use
Install the gem manually :
```
$ gem install term-art
```

or add it to your Gemfile :
```diff
+ gem 'term-art'
```

and then run :
```
$ bundle
```

# Documentation
## Styles
There are two differents styles:
* `:simple` ![Simple style](https://i.imgur.com/PmgaCsV.png)
* `:double` ![Double style](https://i.imgur.com/SCyd2Kx.png)
## Colors
See [hue-rb](https://github.com/AnanaGame/hue-rb#colors)

# Example
```ruby
require 'term-art'

chart = TermArt::Chart.new([
  ['A', 'B', 'C'],
  ['D', 'E', 'F']
])
puts chart.draw(style: :simple, color: :red)
```
