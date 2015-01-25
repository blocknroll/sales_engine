require 'csv'
require_relative 'customer'

class CustomerParser

  def make_customers(file)
    contents = CSV.open(file, headers: true, header_converters: :symbol)
    parse(contents)
  end

  private
  def parse(contents)
    contents.map { |row| Customer.new({
      :id         => row[:id],
      :first_name => row[:first_name],
      :last_name  => row[:last_name],
      :created_at => row[:created_at],
      :updated_at => row[:updated_at]
      } ) }
  end

end