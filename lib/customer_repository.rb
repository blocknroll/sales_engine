require_relative 'customer_parser'

class CustomerRepository

  attr_reader :file_to_read, :customer_list

  def initialize(file_to_read)
    @file_to_read = file_to_read
    @customer_parser = CustomerParser.new
    #we want to use customer parser to open the csv file and create customers from it.
    @customer_list = @customer_parser.make_customers(@file_to_read) #you put this in the initialize so that when you load up a customer repo, it loads with all of the customers inside. it populates it from the csv reference you're passing in.
  end

  def all
    customer_list
  end

  def random
    customer_list.sample
  end

  def find_by_first_name(first_name)
    match = customer_list.detect { |e| e.first_name.downcase ==  first_name.downcase }
    match.nil? ? "No match, try again." : "#{match.first_name} #{match.last_name}"
  end

  def find_by_last_name(last_name)
    match = customer_list.detect { |e| e.last_name.downcase == last_name.downcase }
    match.nil? ? "No match, try again." : "#{match.first_name} #{match.last_name}"
  end

  def find_by_id(id)
    match = customer_list.detect { |e| e.id == id }
    match.nil? ? "No match, try again." : "#{match.first_name} #{match.last_name}"
  end

  def find_all_by_first_name(first_name)
    matches = customer_list.select { |e| e.first_name.downcase == first_name.downcase}
    matches.nil? ? [] : matches
   #it's returning an array of objects with first name joey. you want it to return a list of the id, first, and last name of the customers with first name joey. how can you do that?
   #it's an array, so if you match[0].first_name, you should get the first name. 
  end

  def find_all_by_last_name(last_name)
    matches = customer_list.select { |e| e.last_name.downcase == last_name.downcase }
    matches.nil? ? [] : matches
  end

end
 
