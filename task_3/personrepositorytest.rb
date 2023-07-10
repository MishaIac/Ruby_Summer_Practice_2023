require "../task_2/person.rb"
require "../task_2/personrepository.rb"
require 'test/unit'

class PersonRepositoryTest < Test::Unit::TestCase
    def setup
      @repo = PersonRepository.new()
      @person1 = Person.new("First0", "Last1", "AZ0000000000", "01-01-1970")
      @person2 = Person.new("First2", "Last3", "ZA1111111111", "15-10-2010")
      @repo.add(@person1)
      @repo.add(@person2)
    end
  
    def t_add_pers
      person_t = Person.new("Anna", "Maria", "AQ9876543210", "08-05-2001")
      @repo.add(person_t)
      assert_includes(@repo.people, person_t)
    end
  
    def t_add_err_pers

      assert_raise { @repo.add_person("error") }
    end
  
    def t_edit_pers_acc_inn
      new_first = "New"
      new_last = "New1"
      new_birth = "11-11-2011"
      new_inn = "AZ0000000000"
      new_pers = Person.new(new_first, new_last, new_inn, new_birth)
      @repo.edit_acc_inn(new_pers, "AZ0000000000")
      upd_pers = @repo.get_acc_inn("AZ0000000000")
      assert_equal(new_first, upd_pers.first)
      assert_equal(new_last, upd_pers.last)
      assert_equal(new_birth, upd_pers.birth)
    end
  
    def t_del_pers_acc_inn
      @repo.del_acc_inn("AZ0000000000")
      assert_not_includes(@repo.get_all, @person1)
    end
  
    def t_get_all
      assert_includes(@repo.get_all, @person1)
      assert_includes(@repo.get_all, @person2)
    end
  
    def t_get_acc_inn
      assert_equal(@person1, @repo.get_acc_inn("AZ0000000000"))
    end
  
    def t_get_acc_part
      matching_people = @repo.get_acc_part("t1")
      assert_includes(matching_people, @person1)
      assert_not_includes(matching_people, @person2)
    end
  
    def t_get_acc_date_range
      date_from = "01-01-1969"
      date_to = "15-10-2011"
      people_in_range = @repo.get_acc_date_range(date_from, date_to)
      assert_includes(people_in_range, @person1)
      assert_includes(people_in_range, @person2)
    end
  end