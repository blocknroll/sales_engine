require_relative 'test_helper'

class ItemRepositoryTest < Minitest::Test

  attr_reader :item_repo, :sales_engine, :data

  def setup
    @data = "test/fixtures/items_fixtures.csv"
    @item_repo = ItemRepository.new("test/fixtures/items_fixtures.csv", self)
    @sales_engine = SalesEngine.new
  end

  def test_it_exists
    assert item_repo
  end

  def test_the_file_to_read_exists
    assert File.exist?(item_repo.file)
  end

  def test_it_returns_all_instances
    assert_equal 100, item_repo.all.count
  end

  def test_it_returns_a_random_instance
    @test = []
    100.times { @test << @item_repo.random }
    @test = @test.uniq
    assert @test.count > 1
  end

  def test_it_returns_a_find_by_id_match
    assert_equal "1", item_repo.find_by_id("1").id
  end

  def test_it_returns_a_find_by_name_match
    assert_equal "Item Qui Esse", item_repo.find_by_name("Item Qui Esse").name
  end

  def test_it_returns_a_find_by_name_lowercase_match
    assert_equal "Item Qui Esse", item_repo.find_by_name("item qui esse").name
  end

  def test_it_returns_a_find_by_description_match
    assert_equal "Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro.", item_repo.find_by_description("Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro.").description
  end

  def test_it_returns_a_find_by_unit_price_match
    assert_equal "75107", item_repo.find_by_unit_price("75107").unit_price
  end

  def test_it_returns_a_find_by_merchant_id_match
    assert_equal "1", item_repo.find_by_merchant_id("1").merchant_id
  end

  def test_it_returns_a_find_by_created_at_match
    assert_equal "2012-03-27 14:53:59 UTC", item_repo.find_by_created_at("2012-03-27 14:53:59 UTC").created_at
  end

  def test_it_returns_a_find_by_updated_at_match
    assert_equal "2012-03-27 14:53:59 UTC", item_repo.find_by_updated_at("2012-03-27 14:53:59 UTC").updated_at
  end

  # find_all_by_id

  def test_it_returns_a_find_all_by_id_match
    assert_equal 1, item_repo.find_all_by_id("1").count
    assert_equal 1, item_repo.find_all_by_id("2").count
  end

  def test_it_returns_an_empty_array_when_no_find_all_by_id_match_exists
    assert_equal [], item_repo.find_all_by_id("0")
    assert_equal [], item_repo.find_all_by_id(" ")
  end

  def test_it_returns_zero_when_no_find_all_by_id_match_exists
    assert_equal 0, item_repo.find_all_by_id("0").count
    assert_equal 0, item_repo.find_all_by_id(" ").count
  end

  # find_all_by_name

  def test_it_returns_a_find_all_by_name_match
    assert_equal 3, item_repo.find_all_by_name("Item Qui Esse").count
    assert_equal 1, item_repo.find_all_by_name("Item Nemo Facere").count
  end

  def test_it_returns_an_empty_array_when_no_find_all_by_name_match_exists
    assert_equal [], item_repo.find_all_by_name("Item Qui Es")
    assert_equal [], item_repo.find_all_by_name(" ")
  end

  def test_it_returns_zero_when_no_find_all_by_name_match_exists
    assert_equal 0, item_repo.find_all_by_name("Item Qui Es").count
    assert_equal 0, item_repo.find_all_by_name(" ").count
  end

  # find_all_by_description

  def test_it_returns_a_find_all_by_description_match
    assert_equal 1, item_repo.find_all_by_description("Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro.").count
    assert_equal 2, item_repo.find_all_by_description("cool thing").count
  end

  def test_it_returns_an_empty_array_when_no_find_all_by_description_match_exists
    assert_equal [], item_repo.find_all_by_description("super cool thing")
    assert_equal [], item_repo.find_all_by_description(" ")
  end

  def test_it_returns_zero_when_no_find_all_by_description_match_exists
    assert_equal 0, item_repo.find_all_by_description("super cool thing").count
    assert_equal 0, item_repo.find_all_by_description(" ").count
  end

  # find_all_by_unit_price

  def test_it_returns_a_find_all_by_unit_price_match
    assert_equal 1, item_repo.find_all_by_unit_price("75107").count
    assert_equal 3, item_repo.find_all_by_unit_price("58238").count
  end

  def test_it_returns_an_empty_array_when_no_find_all_by_unit_price_match_exists
    assert_equal [], item_repo.find_all_by_unit_price("55555")
    assert_equal [], item_repo.find_all_by_unit_price(" ")
  end

  def test_it_returns_zero_when_no_find_all_by_unit_price_match_exists
    assert_equal 0, item_repo.find_all_by_unit_price("55555").count
    assert_equal 0, item_repo.find_all_by_unit_price(" ").count
  end

  # find_all_by_merchant_id

  def test_it_returns_a_find_all_by_merchant_id_match
    assert_equal 15, item_repo.find_all_by_merchant_id("1").count
    assert_equal  9, item_repo.find_all_by_merchant_id("5").count
  end

  def test_it_returns_an_empty_array_when_no_find_all_by_merchant_id_match_exists
    assert_equal [], item_repo.find_all_by_merchant_id("55555")
    assert_equal [], item_repo.find_all_by_merchant_id(" ")
  end

  def test_it_returns_zero_when_no_find_all_by_merchant_id_match_exists
    assert_equal 0, item_repo.find_all_by_merchant_id("55555").count
    assert_equal 0, item_repo.find_all_by_merchant_id(" ").count
  end

  # find_all_by_created_at

  def test_it_returns_a_find_all_by_created_at_match
    assert_equal 99, item_repo.find_all_by_created_at("2012-03-27 14:53:59 UTC").count
    assert_equal  1, item_repo.find_all_by_created_at("2014-03-27 14:53:59 UTC").count
  end

  def test_it_returns_an_empty_array_when_no_find_all_by_created_at_match_exists
    assert_equal [], item_repo.find_all_by_created_at("1999")
    assert_equal [], item_repo.find_all_by_created_at(" ")
  end

  def test_it_returns_zero_when_no_find_all_by_created_at_match_exists
    assert_equal 0, item_repo.find_all_by_created_at("1999").count
    assert_equal 0, item_repo.find_all_by_created_at(" ").count
  end

  # find_all_by_updated_at

  def test_it_returns_a_find_all_by_updated_at_match
    assert_equal 99, item_repo.find_all_by_updated_at("2012-03-27 14:53:59 UTC").count
    assert_equal  1, item_repo.find_all_by_updated_at("2014-03-27 14:53:59 UTC").count
  end

  def test_it_returns_an_empty_array_when_no_find_all_by_updated_at_match_exists
    assert_equal [], item_repo.find_all_by_updated_at("1999")
    assert_equal [], item_repo.find_all_by_updated_at(" ")
  end

  def test_it_returns_zero_when_no_find_all_by_updated_at_match_exists
    assert_equal 0, item_repo.find_all_by_updated_at("1999").count
    assert_equal 0, item_repo.find_all_by_updated_at(" ").count
  end

  # RELATIONSHIPS

  def test_it_calls_sales_engine_to_find_invoice_items_by_item_id
    sales_engine = Minitest::Mock.new
    item_repo = ItemRepository.new(data, sales_engine)
    sales_engine.expect(:find_invoice_items_by_item_id, nil, [1])
    item_repo.find_invoice_items_by_item_id(1)
    sales_engine.verify
  end

end
