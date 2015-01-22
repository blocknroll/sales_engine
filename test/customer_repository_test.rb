require_relative 'test_helper'


class CustomerRepositoryTest < Minitest::Test
  #the purpose of the customer repo is to hold customers. it needs to talk to the parser, who creates the customers, and receive them into the repo.

  #the first thing that will happen with the customer repository is that it will get data. it doesnt understand what to do with the data, but nonetheless it gets some and looks around for what to do.

  #we are setting up a setup with a customer repository instance that takes a parameter, which is the name of the file where your data lives.

  def setup
    @customer_repo = CustomerRepository.new("test/fixtures/customers_fixtures.csv")
  end

  def test_it_exists
    assert @customer_repo
  end

  #test to see if the file_to_read actually exists. The file to read is the one we pass in.

  def test_the_file_to_read_exists
    assert File.exist?(@customer_repo.file_to_read)
  end

  #you could test that the customer list is full of customers - customer_repo.customer_list.first.class (the class of the first thing in it is a customer - it fills with customers not just items.)

  def test_it_returns_all_instances
    assert_equal 10, @customer_repo.all.count
  end

  def test_it_returns_a_random_instance
    @test = []
    100.times { @test << @customer_repo.random }
    @test = @test.uniq
    assert @test.count > 1
    #create an empty array and shovel in 100 samples from the customer repo (you are grabbing 100 samples from all the customers that are located in the customer repo). Then run uniq on the sample array, and it will pull out all the values that are duplicates. probably you will have 10 in there, very likely you'll have 9, but it is almost certain that you will have more than 1. So that is how you can test if it is returning a random instance.
  end

  def test_it_returns_a_find_by_first_name_match
    assert_equal "Joey Ondricka", @customer_repo.find_by_first_name("Joey")
  end

  def test_it_returns_a_find_by_first_name_lowercase_match
    assert_equal "Joey Ondricka", @customer_repo.find_by_first_name("joey")
  end

  def test_it_returns_a_find_by_last_name_match
    assert_equal "Joey Ondricka", @customer_repo.find_by_last_name("Ondricka")
  end

  def test_it_returns_a_find_by_last_name_lowercase_match
    assert_equal "Joey Ondricka", @customer_repo.find_by_last_name("ondricka")
  end

  def test_it_returns_a_find_by_id_match
    assert_equal "Joey Ondricka", @customer_repo.find_by_id("1")
  end

  def test_it_returns_a_find_all_by_first_name_match
    assert_equal 3, @customer_repo.find_all_by_first_name("Joey").count
  end

  def test_it_returns_a_find_all_by_last_name_match
    assert_equal 2, @customer_repo.find_all_by_last_name("Ondricka").count
  end

  def test_it_returns_an_empty_array_when_no_find_all_by_last_name_match_exists
    assert_equal [], @customer_repo.find_all_by_last_name("ndricka")
  end

  def test_it_returns_zero_when_no_find_all_by_last_name_match_exists
    assert_equal 0, @customer_repo.find_all_by_last_name("ndricka").count
  end



  # def test_it_exists
  #   customer_repo = CustomerRepository.new(["Customer 1", "Customer 2", "Customer 3"])
  #   assert customer_repo
  # end

  # def test_it_has_a_customer_array
  #   customer_repo = CustomerRepository.new(["Customer 1", "Customer 2", "Customer 3"])
  #   assert_equal Array, customer_repo.class
  # end

  # def test_it_can_identify_first_position
  #   customer_repo = CustomerRepository.new(["Customer 1", "Customer 2", "Customer 3"])
  #   assert_equal "Customer 1", customer_repo[0]
  # end


# <CSV::Row id:"1" first_name:"Joey" last_name:"Ondricka" created_at:"2012-03-27 14:54:09 UTC" updated_at:"2012-03-27 14:54:09 UTC">


    # all returns all instances
    # random returns a random instance
    # find_by_X(match), where X is some attribute, returns a single instance whose X attribute case-insensitive attribute matches the match parameter. For instance, customer_repository.find_by_first_name("Mary") could find a Customer with the first name attribute "Mary" or "mary" but not "Mary Ellen".
    #   find_all_by_X(match) works just like find_by_X except it returns a collection of all matches. If there is no match, it returns an empty Array.


end
