require "politicosbr"
require "test/unit"
 
class TestPoliticosBR < Test::Unit::TestCase
 
  def test_deputados
  end
  
  def test_senadores
    x = PoliticosBR.senadores 
    assert_equal(512,x.length)
  end
 
end