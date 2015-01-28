require_relative 'test_helper'

class MerchantRepositoryTest < Minitest::Test

  attr_reader :merchant_repo, :engine

  def setup
    @merchant_repo = MerchantRepository.new("test/fixtures/merchants_fixtures.csv", self)
    @engine = SalesEngine.new
  end

  def test_it_exists
    assert merchant_repo
  end

  def test_the_file_to_read_exists
    assert File.exist?(merchant_repo.file)
  end

  def test_it_returns_all_instances
    assert_equal 10, merchant_repo.all.count
  end

  def test_it_returns_a_random_instance
    @test = []
    100.times { @test << merchant_repo.random }
    @test = @test.uniq
    assert @test.count > 1
  end

  def test_it_returns_a_find_by_id_match
    assert_equal "1", merchant_repo.find_by_id("1").id
  end

  def test_it_returns_a_find_by_name_match
    assert_equal "Schroeder-Jerde", merchant_repo.find_by_name("Schroeder-Jerde").name
  end

  def test_it_returns_a_find_by_name_lowercase_match
    assert_equal "Schroeder-Jerde", merchant_repo.find_by_name("schroeder-jerde").name
  end

  def test_it_returns_a_find_by_created_at_match
    assert_equal "2012-03-27 14:53:59 UTC", merchant_repo.find_by_created_at("2012-03-27 14:53:59 UTC").created_at
  end

  def test_it_returns_a_find_by_updated_at_match
    assert_equal "2012-03-27 14:53:59 UTC", merchant_repo.find_by_updated_at("2012-03-27 14:53:59 UTC").updated_at
  end

  # find_all_by_id

  def test_it_returns_a_find_all_by_id_match
    assert_equal 1, merchant_repo.find_all_by_id("1").count
    assert_equal 1, merchant_repo.find_all_by_id("9").count
  end

  def test_it_returns_an_empty_array_when_no_find_all_by_id_match_exists
    assert_equal [], merchant_repo.find_all_by_id("Schroeder-Jorge")
    assert_equal [], merchant_repo.find_all_by_id(" ")
  end

  def test_it_returns_zero_when_no_find_all_by_id_match_exists
    assert_equal 0, merchant_repo.find_all_by_id("Schroeder-Jorge").count
    assert_equal 0, merchant_repo.find_all_by_id(" ").count
  end

  # find_all_by_name

  def test_it_returns_a_find_all_by_name_match
    assert_equal 3, merchant_repo.find_all_by_name("Williamson Group").count
    assert_equal 1, merchant_repo.find_all_by_name("Hand-Spencer").count
  end

  def test_it_returns_an_empty_array_when_no_find_all_by_name_match_exists
    assert_equal [], merchant_repo.find_all_by_name("Schroeder-Jorge")
    assert_equal [], merchant_repo.find_all_by_name(" ")
  end

  def test_it_returns_zero_when_no_find_all_by_name_match_exists
    assert_equal 0, merchant_repo.find_all_by_name("Schroeder-Jorge").count
    assert_equal 0, merchant_repo.find_all_by_name(" ").count
  end

  # find_all_by_created_at

  def test_it_returns_a_find_all_by_created_at_match
    assert_equal 9, merchant_repo.find_all_by_created_at("2012-03-27 14:53:59 UTC").count
    assert_equal 1, merchant_repo.find_all_by_created_at("2014-03-27 14:54:00 UTC").count
  end

  def test_it_returns_an_empty_array_when_no_find_all_by_created_at_match_exists
    assert_equal [], merchant_repo.find_all_by_created_at("1999")
    assert_equal [], merchant_repo.find_all_by_created_at(" ")
  end

  def test_it_returns_zero_when_no_find_all_by_created_at_match_exists
    assert_equal 0, merchant_repo.find_all_by_created_at("1999").count
    assert_equal 0, merchant_repo.find_all_by_created_at(" ").count
  end

  # find_all_by_updated_at

  def test_it_returns_a_find_all_by_updated_at_match
    assert_equal 8, merchant_repo.find_all_by_updated_at("2012-03-27 14:53:59 UTC").count
    assert_equal 1, merchant_repo.find_all_by_updated_at("2014-03-27 14:54:00 UTC").count
  end

  def test_it_returns_an_empty_array_when_no_find_all_by_updated_at_match_exists
    assert_equal [], merchant_repo.find_all_by_updated_at("1999")
    assert_equal [], merchant_repo.find_all_by_updated_at(" ")
  end

  def test_it_returns_zero_when_no_find_all_by_updated_at_match_exists
    assert_equal 0, merchant_repo.find_all_by_updated_at("1999").count
    assert_equal 0, merchant_repo.find_all_by_updated_at(" ").count
  end

  # RELATIONSHIPS

  def test_it_can_find_items_using_id
    assert_equal 15, engine.find_items_using_merchant(1)
    # assert_equal  9, engine.find_items_using_merchant(5)
  end

end
