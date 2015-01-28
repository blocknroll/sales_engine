require_relative 'customer'

class CustomerParser

  def make_customer(file, sales_engine=nil)
    contents = CSV.open(file, headers: true, header_converters: :symbol)
    parse(contents, sales_engine)
  end

  private
  def parse(contents, sales_engine=nil)
    contents.map { |row| Customer.new({
      :id         => row[:id],
      :first_name => row[:first_name],
      :last_name  => row[:last_name],
      :created_at => row[:created_at],
      :updated_at => row[:updated_at]
      }, sales_engine ) }
  end

end