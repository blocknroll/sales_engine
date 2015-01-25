# require_relative 'merchant'

class MerchantParser
  def make_merchant(file)
    contents = CSV.open(file, headers: true, header_converters: :symbol)
    parse_file(contents)
  end

  def parse_file(contents)
    contents.map { |row| Merchant.new(
      row[:id],
      row[:name],
      row[:created_at],
      row[:updated_at]
      ) }
    end
end
