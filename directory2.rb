
# input students
def input_students
  puts "Please enter the name of a student"

  students = []
  
  name = gets.delete("\n")

  while !name.empty? do
    puts "Please confirm the month #{name} is joining the Academy"
    cohort = gets.chomp
    cohort = "Unconfirmed start date" if cohort.length == 0

    puts "Please confirm the country #{name} was born in"
    country = gets.chomp
    country = "unknown origin" if country.length == 0

    students << {name: name, cohort: cohort, country: country}

    if students.length == 1 
      puts "We have our first student. Enter another name or hit Return to finish." 
    else
      puts "We now we have #{students.count} students. Enter another name or hit Return to finish."
    end
    name = gets.delete("\n")
  end
  students
end

# print header
def print_header
  puts "The students of Villians Academy"
  puts "-------------".center(30)
end

# print students
def print(students)
  students = students.sort_by { |student| student[:cohort] }
  cohorts = []
  students.each do |student|
    unless cohorts.include?(student[:cohort])
      cohorts << student[:cohort]
      puts "#{student[:cohort]}"
    end
      puts "#{student[:name]}, from #{student[:country]}"
  end
end

# print footer
def print_footer(names)
  puts "We have #{names.length} great student#{"s" if names.length != 1}"
end 

def check_for_students(students)
  if students.length == 0
    puts "Villians Academy is temporarily closed"
    exit
  end
end

# run
students = input_students
check_for_students(students)
print_header
print(students)
print_footer(students)