# term-art
## Boards [`TermArt::Board`](lib/board.rb)

Generate boards with unlimited lines and auto-aligment there are 2 differents styles:

First of all create your Board object with 2 parameters, the titles and the lines

```ruby
board = TermArt::Board.new(
  ["Name", "Ruby", "Java"],
  [["Hugo", "X", "X"], ["Paul", "", "X"]]
)
```

* Simple

```ruby
puts board.draw(:simple)
```

![](https://i.imgur.com/PmgaCsV.png)

* Double

```ruby
puts board.draw(:double)
```

![](https://i.imgur.com/SCyd2Kx.png)

And you can too add colors to separators, here is the list of colors:
* `:red`
* `:green`
* `:yellow`
* `:blue`
* `:magenta`
* `:cyan`

```ruby
puts board.draw(:double, :red)
```

![](https://i.imgur.com/SWOmvMd.png)
