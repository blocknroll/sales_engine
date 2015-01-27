# require_relative 'item'

class ItemParser

  def make_items(file)
    contents = CSV.open(file, headers: true, header_converters: :symbol)
    parse(contents)
  end

  def parse(contents)
    contents.map { |row| Item.new({
      :id           => row[:id],
      :name         => row[:name],
      :description  => row[:description],
      :unit_price   => row[:unit_price],
      :merchant_id  => row[:merchant_id],
      :created_at   => row[:created_at],
      :updated_at   => row[:updated_at]
      }) }
    end

  end
