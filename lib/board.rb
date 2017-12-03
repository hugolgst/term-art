class Board

  attr_reader :titles, :lines

  def initialize(titles, lines)
    @titles = titles.sort
    @lines = lines
  end

  def draw(style) # Differents styles
    styles = {
      # Name  => Separators
      :simple => '┌┬┐├┼┤└┴┘│─',
      :double => '╔╦╗╠╬╣╚╩╝║═'
    }

    style = styles[style]
    # Get all the sizes of columns
    max_lengths = @lines.dup.push(@titles).transpose.map {|column| column.max_by(&:size).size}

    # Get the horizontal separators
    horizontal_columns = []
    max_lengths.each do |column_size|
      horizontal_columns << style[-1] * (column_size + 2)
    end

    # Get all separators
    up = style[0] + horizontal_columns.join(style[1]) + style[2]
    separator = style[3] + horizontal_columns.join(style[4]) + style[5]
    down = style[6] + horizontal_columns.join(style[7]) + style[8]

    formatted_lines = []

    all_lines = @lines.dup.unshift(titles)

    all_lines.each_index do |line_index| # Center all line items
      line = all_lines[line_index]
      line = line.map {|item| item.center max_lengths[line.index item]}

      # Format the line with vertical separator
      vertical_separator = style[-2]
      line = "#{vertical_separator} #{line.join(" #{vertical_separator} ")} #{vertical_separator}"

      formatted_lines << line
    end

    [up, formatted_lines.join("\n#{separator}\n"), down].join("\n")
  end

end