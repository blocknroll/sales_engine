require_relative 'test_helper'

class ItemRepositoryTest < Minitest::Test

  def setup
    @item_repo = ItemRepository.new("test/fixtures/items_fixtures.csv")
  end

  def test_it_exists
    assert @item_repo
  end

  #test to see if the file_to_read actually exists. The file to read is the one we pass in.

  def test_the_file_to_read_exists
    assert File.exist?(@item_repo.file_to_read)
  end

  #you could test that the item list is full of items - item_repo.item_list.first.class (the class of the first thing in it is an item - it fills with items.)

  def test_it_returns_all_instances
    assert_equal 10, @item_repo.all.count
  end

  def test_it_returns_a_random_instance
    @test = []
    100.times { @test << @item_repo.random }
    @test = @test.uniq
    assert @test.count > 1
    #create an empty array and shovel in 100 samples from the item repo (you are grabbing 100 samples from all the items that are located in the item repo). Then run uniq on the sample array, and it will pull out all the values that are duplicates. probably you will have 10 in there, very likely you'll have 9, but it is almost certain that you will have more than 1. So that is how you can test if it is returning a random instance.
  end

  def test_it_returns_a_find_by_name_match
    assert_equal "Item Qui Esse", @item_repo.find_by_name("Item Qui Esse")
  end

  def test_it_returns_a_find_by_name_lowercase_match
    assert_equal "Item Qui Esse", @item_repo.find_by_name("item qui esse")
  end

  def test_it_returns_a_find_by_id_match
    assert_equal "Item Qui Esse", @item_repo.find_by_id("1")
  end

  def test_it_returns_a_find_all_by_name_match
    assert_equal 3, @item_repo.find_all_by_name("Item Qui Esse").count
  end

  def test_it_returns_an_empty_array_when_no_find_all_by_name_match_exists
    assert_equal [], @item_repo.find_all_by_name("Item Qui Es")
  end

  def test_it_returns_zero_when_no_find_all_by_name_match_exists
    assert_equal 0, @item_repo.find_all_by_name("Item Qui Es").count
  end

end
