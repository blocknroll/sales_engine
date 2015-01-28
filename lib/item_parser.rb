# require_relative 'item'

class ItemParser

  def make_item(file, sales_engine=nil)
    contents = CSV.open(file, headers: true, header_converters: :symbol)
    parse(contents, sales_engine)
  end

  private

  def parse(contents, sales_engine=nil)
    contents.map { |row| Item.new({
      :id           => row[:id],
      :name         => row[:name],
      :description  => row[:description],
      :unit_price   => row[:unit_price],
      :merchant_id  => row[:merchant_id],
      :created_at   => row[:created_at],
      :updated_at   => row[:updated_at]
      }, sales_engine ) }
    end

  end
