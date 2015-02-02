
require_relative 'checksplitter'
require 'minitest/autorun'
class Checksplittertest < Minitest::Test
  def test_ing_have_an_outing
    dc = Dinerclub.new
    assert_equal({"Kelly" => 150, "Luke" => 150, "Anne" => 150, "Becky" => 150}, dc.have_an_outing(500, 20, "Kelly", "Luke", "Anne", "Becky"))
  end
  def test_for_split_bill_works_properly
    cs = Checksplitter.new( 5000, 10, 20)
    assert_equal(275, cs.check_split)
  end
end