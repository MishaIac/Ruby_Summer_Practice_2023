require "date"
module Validation
  def self.valid?(string, type)
    case type
        when "name"
            return false if string.length > 40
            return true if string.match(/^(?=.{1,30}$)(\p{Lu}\p{Ll}*(-\p{Lu}\p{Ll}*)*)$/)
        when "inn"
            return false unless string.length == 12
            return true if string.match(/\A[A-Z]{2}\d{10}\z/)
        when "date"
            birth_date = Date.parse(string)
            return false if !birth_date
            birth_date < Date.today
    end
  end
end
name = "Anna-Maria"
inn = "AZ1234543456"
birth_date = "2023-10-10"
puts("Results:")
Validation.valid?(name, "name") ? puts("Name: #{name}") : puts("Name Error")
Validation.valid?(inn, "inn") ? puts("INN: #{inn}") : puts("INN Error")
Validation.valid?(birth_date, "date") ? puts("Date: #{birth_date}") : puts("Date Error")