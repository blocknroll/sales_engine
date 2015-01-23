# require_relative 'merchant'

class MerchantParser
  def make_merchants(merchant_file_to_read)
    contents = CSV.open(merchant_file_to_read, headers: true, header_converters: :symbol)
    parse_file(contents)
  end

  def parse_file(contents)
    contents.map { |row| Merchant.new(
      row[:id],
      row[:name],
      ) }
    end
end












# class MerchantParser
#   attr_reader :filename
#
#   def initialize(input_filename)
#     @filename = input_filename
#   end
#
#   def parse
#     file = CSV.open(filename, :headers => true, :header_converters => :symbol)
#     file.map do |line|
#       Merchant.new(line, nil)
#     end
#   end
# end
