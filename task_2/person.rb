require_relative "consoleinput"

class Person
    include ConsoleInput

    attr_reader :first, :last, :inn, :birth

    def initialize(first, last, inn, birth)
        @first = first
        @last = last
        @inn = inn
        @birth = birth
    end

    def set_first(first)
        @first = first
    end

    def set_last(last)
        @last = last
    end

    def set_inn(inn)
        @inn = inn
    end

    def set_birth(birth)
        @birth = birth
    end
end