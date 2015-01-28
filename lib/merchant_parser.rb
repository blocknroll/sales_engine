# require_relative 'merchant'

class MerchantParser

  def make_merchant(file, sales_engine=nil)
    contents = CSV.open(file, headers: true, header_converters: :symbol)
    parse(contents, sales_engine)
  end

  private

  def parse(contents, sales_engine=nil)
    contents.map { |row| Merchant.new({
      :id         => row[:id],
      :name       => row[:name],
      :created_at => row[:created_at],
      :updated_at => row[:updated_at]
      }, sales_engine ) }
  end

end
