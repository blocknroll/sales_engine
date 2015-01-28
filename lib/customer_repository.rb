require_relative 'customer_parser'

class CustomerRepository

  attr_reader :file, :all, :sales_engine

  def initialize(file, sales_engine)
    @file = file
    @customer_parser = CustomerParser.new
    @all = @customer_parser.make_customers(@file, self)
    @sales_engine = sales_engine
  end

  def random
    all.sample
  end

  def find_by_first_name(first_name)
    match = all.detect { |e| e.first_name.downcase ==  first_name.downcase }
    match.nil? ? "No match, try again." : match
  end

  def find_by_last_name(last_name)
    match = all.detect { |e| e.last_name.downcase == last_name.downcase }
    match.nil? ? "No match, try again." : match
  end

  def find_by_id(id)
    match = all.detect { |e| e.id == id }
    match.nil? ? "No match, try again." : match
  end

  def find_all_by_first_name(first_name)
    matches = all.select { |e| e.first_name.downcase == first_name.downcase}
    matches.nil? ? [] : matches
  end

  def find_all_by_last_name(last_name)
    matches = all.select { |e| e.last_name.downcase == last_name.downcase }
    matches.nil? ? [] : matches
  end

end
