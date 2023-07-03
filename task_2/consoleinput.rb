require_relative "validation"

module ConsoleInput
    include Validation

    def input_str()
        puts("input str")
        str = gets.chomp
        if str.kind_of?(String) && !str.empty?
            return str
        else
            input_str()
        end
    end

    def input_int()
        puts("input int")
        int = gets.chomp
        if int.to_i != 0
            return int.to_i
        else
            input_int()
        end
    end

    def input_name()
        puts("input name")
        name = gets.chomp
        if valid?(name, "name")
            return name
        else
            input_name()
        end
    end

    def input_inn()
        puts("input inn")
        inn = gets.chomp
        if valid?(inn, "inn")
            return inn
        else
            input_inn()
        end
    end

    def input_date()
        puts("input date")
        date = gets.chomp
        if valid?(date, "date")
            return date
        else
            input_date()
        end
    end

end

#include ConsoleInput
#puts(input_date())
