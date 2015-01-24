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
    assert_equal 100, @item_repo.all.count
  end

  def test_it_returns_a_random_instance
    @test = []
    100.times { @test << @item_repo.random }
    @test = @test.uniq
    assert @test.count > 1
    #create an empty array and shovel in 100 samples from the item repo (you are grabbing 100 samples from all the items that are located in the item repo). Then run uniq on the sample array, and it will pull out all the values that are duplicates. probably you will have 10 in there, very likely you'll have 9, but it is almost certain that you will have more than 1. So that is how you can test if it is returning a random instance.
  end

  def test_it_returns_a_find_by_id_match
    assert_equal "Item Qui Esse", @item_repo.find_by_id("1")
  end

  def test_it_returns_a_find_by_name_match
    assert_equal "Item Qui Esse", @item_repo.find_by_name("Item Qui Esse")
  end

  def test_it_returns_a_find_by_name_lowercase_match
    assert_equal "Item Qui Esse", @item_repo.find_by_name("item qui esse")
  end

  def test_it_returns_a_find_by_description_match
    assert_equal "Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro.", @item_repo.find_by_description("Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro.")
  end

  def test_it_returns_a_find_by_unit_price_match
    assert_equal "75107", @item_repo.find_by_unit_price("75107")
  end

  def test_it_returns_a_find_by_merchant_id_match
    assert_equal "1", @item_repo.find_by_merchant_id("1")
  end

  def test_it_returns_a_find_by_created_at_match
    assert_equal "2012-03-27 14:53:59 UTC", @item_repo.find_by_created_at("2012-03-27 14:53:59 UTC")
  end

  def test_it_returns_a_find_by_updated_at_match
    assert_equal "2012-03-27 14:53:59 UTC", @item_repo.find_by_updated_at("2012-03-27 14:53:59 UTC")
  end

  # find_all_by_id

  def test_it_returns_a_find_all_by_id_match
    assert_equal 1, @item_repo.find_all_by_id("1").count
    assert_equal 1, @item_repo.find_all_by_id("2").count
  end

  def test_it_returns_an_empty_array_when_no_find_all_by_id_match_exists
    assert_equal [], @item_repo.find_all_by_id("0")
    assert_equal [], @item_repo.find_all_by_id(" ")
  end

  def test_it_returns_zero_when_no_find_all_by_id_match_exists
    assert_equal 0, @item_repo.find_all_by_id("0").count
    assert_equal 0, @item_repo.find_all_by_id(" ").count
  end

  # find_all_by_name

  def test_it_returns_a_find_all_by_name_match
    assert_equal 3, @item_repo.find_all_by_name("Item Qui Esse").count
    assert_equal 1, @item_repo.find_all_by_name("Item Nemo Facere").count
  end

  def test_it_returns_an_empty_array_when_no_find_all_by_name_match_exists
    assert_equal [], @item_repo.find_all_by_name("Item Qui Es")
    assert_equal [], @item_repo.find_all_by_name(" ")
  end

  def test_it_returns_zero_when_no_find_all_by_name_match_exists
    assert_equal 0, @item_repo.find_all_by_name("Item Qui Es").count
    assert_equal 0, @item_repo.find_all_by_name(" ").count
  end

  # find_all_by_description

  def test_it_returns_a_find_all_by_description_match
    assert_equal 1, @item_repo.find_all_by_description("Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro.").count
    assert_equal 2, @item_repo.find_all_by_description("cool thing").count
  end

  def test_it_returns_an_empty_array_when_no_find_all_by_description_match_exists
    assert_equal [], @item_repo.find_all_by_description("super cool thing")
    assert_equal [], @item_repo.find_all_by_description(" ")
  end

  def test_it_returns_zero_when_no_find_all_by_description_match_exists
    assert_equal 0, @item_repo.find_all_by_description("super cool thing").count
    assert_equal 0, @item_repo.find_all_by_description(" ").count
  end



end
