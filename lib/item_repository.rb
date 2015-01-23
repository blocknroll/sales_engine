# require_relative 'item_parser'

class ItemRepository

  attr_reader :file_to_read, :all

  def initialize(file_to_read)
    @file_to_read = file_to_read
    @item_parser = ItemParser.new
    #we want to use item parser to open the csv file and create items from it.
    @all = @item_parser.make_items(@file_to_read) #you put this in the initialize so that when you load up an item repo, it loads with all of the items inside. it populates it from the csv reference you're passing in.
  end

  def random
    all.sample
  end

  def find_by_name(name)
    match = all.detect { |e| e.name.downcase ==  name.downcase }
    match.nil? ? "No match, try again." : "#{match.name}"
  end

  def find_by_id(id)
    match = all.detect { |e| e.id == id }
    match.nil? ? "No match, try again." : "#{match.name}"
  end

  def find_all_by_name(name)
    matches = all.select { |e| e.name.downcase == name.downcase}
    matches.nil? ? [] : matches
    # it's returning an array of objects with items name.
    # you want it to return a list of the id and name of the items
    # with name "Item Qui Esse". how can you do that?
    # it's an array, so if you match[0].name, you should get the first name.
  end

end
