# require_relative 'merchant'

class MerchantParser

  def make_merchant(file)
    contents = CSV.open(file, headers: true, header_converters: :symbol)
    parse(contents)
  end

  private

  def parse(contents)
    contents.map { |row| Merchant.new({
      :id         => row[:id],
      :name       => row[:name],
      :created_at => row[:created_at],
      :updated_at => row[:updated_at]
      }) }
  end
end
