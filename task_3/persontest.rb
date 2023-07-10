require "../task_2/person.rb"
require 'test/unit'

class PersonTest < Test::Unit::TestCase
    def setup
      @person = Person.new("Test", "Tset", "AZ0000000000", "09-08-2003")
    end
  
    def t_ok_first
      assert_equal('Test', @person.first)
    end
  
    def t_ok_last
      assert_equal('Tset', @person.last)
    end
  
    def t_ok_inn
      assert_equal('AZ0000000000', @person.inn)
    end
  
    def t_ok_birth
      assert_equal('09-08-2003', @person.birth)
    end
  
    def t_err_first
      assert_raise { @person.first = 'First' }
    end
  
    def t_err_last
      assert_raise { @person.last = 'Last' }
    end
  
    def t_err_inn
      assert_raise { @person.inn = 'AZ3213213210' }
    end
  
    def t_err_birth
      assert_raise { @person.birth = '01-01-1970' }
    end
  end