require_relative 'item'

class ItemParser

  def make_items(item_file_to_read)
    contents = CSV.open(item_file_to_read, headers: true, header_converters: :symbol)
    parse_file(contents)
  end

  def parse_file(contents)
    contents.map { |row| Item.new(
      row[:id],
      row[:name],
      row[:description],
      row[:unit_price],
      row[:merchant_id]
      ) }
    end

  end
