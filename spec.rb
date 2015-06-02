require_relative 'supermarket_four'
require 'minitest/autorun'
require 'minitest/spec'

class SupermarketFourSpec < Minitest::Spec
  let(:rules) do 
    {
      'A' => 50,
      'B' => 30,
      'C' => 20,
      'D' => 15,
      'AAA' => 130,
      'BB' => 45
    } 
  end
  
  it 'returns the correct totals' do 
    assert_equal(  0, price(""))
    assert_equal( 50, price("A"))
    assert_equal( 80, price("AB"))
    assert_equal(115, price("CDBA"))

    assert_equal(100, price("AA"))
    assert_equal(130, price("AAA"))
    assert_equal(180, price("AAAA"))
    assert_equal(230, price("AAAAA"))
    assert_equal(260, price("AAAAAA"))

    assert_equal(160, price("AAAB"))
    assert_equal(175, price("AAABB"))
    assert_equal(190, price("AAABBD"))
    assert_equal(190, price("DABABA"))
  end

  it 'returns the corrrect cost of each item in series' do
    register = SupermarketFour::Checkout.new(rules)
    assert_equal(  0, register.total)
    register.scan("A");  assert_equal( 50, register.total)
    register.scan("B");  assert_equal( 80, register.total)
    register.scan("A");  assert_equal(130, register.total)
    register.scan("A");  assert_equal(160, register.total)
    register.scan("B");  assert_equal(175, register.total)
  end

  private
    
  def price(goods)
   register = SupermarketFour::Checkout.new(rules) 
   goods.split(//).each { |item| register.scan(item) }
   register.total
  end
end
