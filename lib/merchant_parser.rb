# require_relative 'merchant'

class MerchantParser

  def make_merchant(file, parent=nil)
    contents = CSV.open(file, headers: true, header_converters: :symbol)
    parse(contents, parent)
  end

  private

  def parse(contents, parent)
    contents.map { |row| Merchant.new({
      :id         => row[:id],
      :name       => row[:name],
      :created_at => row[:created_at],
      :updated_at => row[:updated_at]
      }, parent ) }
  end
  
end
