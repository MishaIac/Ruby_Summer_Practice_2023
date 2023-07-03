require_relative "personrepository"

pers = Person.new("First", "Last", "AZ1234567890", "03-07-2022")
repo = PersonRepository.new()
repo.add(pers)
repo.print_all
puts(repo.get_acc_inn("AZ1234567890").first)
pers_new = Person.new("First1", "Last1", "AZ3213213210", "01-01-1970")
repo.edit_acc_inn(pers_new, "AZ1234567890")
repo.print_all
puts(repo.get_acc_part("First1").inn)
puts("-----------------------------------")

repo.add(Person.new("Test", "Tset", "AZ0000000000", "09-08-2003"))
repo.print_all
puts(repo.get_acc_date_range(nil, "01-01-2002").birth)
puts(repo.get_acc_date_range("01-01-2002", nil).birth)
puts(repo.get_acc_date_range("01-01-2002", "01-01-2005").birth)