require_relative 'customer_parser'

class CustomerRepository

  attr_reader :file, :all

  def initialize(file)
    @file = file
    @customer_parser = CustomerParser.new
    #we want to use customer parser to open the csv file and create customers from it.
    @all = @customer_parser.make_customers(@file) #you put this in the initialize so that when you load up a customer repo, it loads with all of the customers inside. it populates it from the csv reference you're passing in.
  end

  def random
    all.sample
  end

  def find_by_first_name(first_name)
    match = all.detect { |e| e.first_name.downcase ==  first_name.downcase }
    match.nil? ? "No match, try again." : "#{match.first_name} #{match.last_name}"
  end

  def find_by_last_name(last_name)
    match = all.detect { |e| e.last_name.downcase == last_name.downcase }
    match.nil? ? "No match, try again." : "#{match.first_name} #{match.last_name}"
  end

  def find_by_id(id)
    match = all.detect { |e| e.id == id }
    match.nil? ? "No match, try again." : "#{match.first_name} #{match.last_name}"
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
