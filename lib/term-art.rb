require 'hue'

module TermArt
  class Chart
    STYLES = {
      simple: '┌┬┐├┼┤└┴┘│─',
      double: '╔╦╗╠╬╣╚╩╝║═'
    }.freeze

    attr_reader :lines

    def initialize(lines)
      @lines = lines
    end

    def draw(params)
      params[:color] = :white if params[:color].nil?
      style = style(params)
      lengths = columns_length
      horizontal_columns_separators = horizontal_columns_separators(lengths, style)

      up = style[0] + horizontal_columns_separators.join(style[1]) + style[2]
      separator = style[3] + horizontal_columns_separators.join(style[4]) + style[5]
      down = style[6] + horizontal_columns_separators.join(style[7]) + style[8]

      formatted_lines = []

      @lines.each_index do |line_index|
        line = @lines[line_index]
        line = line.map { |item| item.center(lengths[line.index(item)]) }

        vertical_separator = style[-2]
        line = vertical_separator + ' ' +
               line.join(" #{vertical_separator} ") + ' ' +vertical_separator.to_s

        formatted_lines << line
      end

      [up, formatted_lines.join("\n#{separator}\n"), down].join("\n")
    end

    private

    def columns_length
      @lines.transpose.map do |column|
        column.max_by(&:size).size
      end
    end

    def horizontal_columns_separators(lengths, style)
      lengths.dup.map do |column_size|
        style[-1] * (column_size + 2)
      end
    end

    def style(params)
      STYLES[params[:style]].chars.map do |separator|
        separator.send(params[:color]) + ''.white
      end
    end
  end
end