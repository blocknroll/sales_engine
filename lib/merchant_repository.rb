class MerchantRepository

  attr_reader :file, :all

  def initialize(file)
    @file = file
    @merchant_parser = MerchantParser.new
    #we want to use merchant_parser to open the csv file and create merchants from it.
    @all = @merchant_parser.make_merchant(@file) #you put this in the initialize so that when you load up a merchant repo, it loads with all of the merchants inside. it populates it from the csv reference you're passing in.
  end

  def random
    all.sample
  end

  def find_by_id(id)
    match = all.detect { |e| e.id == id }
    match.nil? ? "No match, try again." : match
  end

  def find_by_name(name)
    match = all.detect { |e| e.name.downcase ==  name.downcase }
    match.nil? ? "No match, try again." : match
  end

  def find_by_created_at(time)
    match = all.detect { |e| e.created_at == time}
    match.nil? ? "No match, try again." : match
  end

  def find_by_updated_at(time)
    match = all.detect { |e| e.updated_at == time}
    match.nil? ? "No match, try again." : match
  end

  # find_all_by_

  def find_all_by_id(id)
    matches = all.select { |e| e.id == id }
    matches.nil? ? [] : matches
  end

  def find_all_by_name(name)
    matches = all.select { |e| e.name.downcase == name.downcase}
    matches.nil? ? [] : matches
  end

  def find_all_by_created_at(created_at)
    matches = all.select { |e| e.created_at == created_at }
    matches.nil? ? [] : matches
  end

  def find_all_by_updated_at(updated_at)
    matches = all.select { |e| e.updated_at == updated_at }
    matches.nil? ? [] : matches
  end


end
