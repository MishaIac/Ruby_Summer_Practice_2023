require_relative "person"

class PersonRepository
    def initialize()
        @people = []
    end

    def get_all()
        return @people
    end

    def print_all()
        idx = 1
        for person in @people
            puts("#{idx}. #{person.first} #{person.last} #{person.inn} #{person.birth} ")
            #puts(person)
        end
    end

    def add(pers)
        if pers.kind_of?(Person)
            @people << pers
        end
    end

    def get_acc_inn(inn)
        temp = @people.find { |per| per.inn == inn }
        if !temp.nil?
            return temp
        else
            puts "! Not Found !"
            return nil
        end
    end

    def del_acc_inn(inn)
        pers = get_acc_inn(inn)
        @people.delete(pers) if pers
    end

    def edit_acc_inn(newpers, inn)
        if newpers.kind_of?(Person)
            pers = get_acc_inn(inn)
            if pers
                pers.set_first(newpers.first)
                pers.set_last(newpers.last)
                pers.set_inn(newpers.inn)
                pers.set_birth(newpers.birth)
            end
        end
    end

    def get_acc_part(part)
        @people.select { |pers| pers.first.include?(part) || pers.last.include?(part) }[0]
    end

    def get_acc_date_range(from = nil, to = nil)
        if from.nil? && to.nil?
          "Error"
        elsif from.nil?
          to = Date.parse(to)
          @people.select { |pers| Date.parse(pers.birth) <= to }[0]
        elsif to.nil?
          from = Date.parse(from)
          @people.select { |pers| Date.parse(pers.birth) >= from }[0]
        else
        from = Date.parse(from)
          to = Date.parse(to)
          @people.select { |pers| Date.parse(pers.birth) >= from && Date.parse(pers.birth) <= to }[0]
        end
    end
end
