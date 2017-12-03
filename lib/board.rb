class Board

  attr_reader :titles, :lines

  def initialize(titles, lines)
    @titles = titles
    @lines = lines
  end

  def draw(style)
    styles = {
      :simple => "╔╦╗╠╬╣╚╩╝║═",
      :double => "┌┬┐├┼┤└┴┘│─"
    }
  end

end