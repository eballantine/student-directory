@students = []

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  
  name = gets.delete("\n")

  while !name.empty? do
    @students << {name: name, cohort: :november}
    if @students.length == 1 
      puts "Our first student" 
    else
      puts "Now we have #{@students.count} students"
    end
    name = gets.delete("\n")
  end
end

def print_header
  puts "The students of Villians Academy"
  puts "-------------"
end

def print_students_list
  @students.each_with_index do |student, index|
    puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  case @students.length
  when 0
    puts "We have no students"
  when 1 
    puts "We have 1 great student"
  else
    puts "Overall, we have #{@students.count} great students"
  end
end 

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(menu_item)
  case menu_item
  when "1"
    students = input_students
  when "2"
    show_students
  when "9"
    exit 
  else
    puts "I don't know what you meant, please try again"
  end
end

def interactive_menu
  @students = []
  loop do
    print_menu
    process(gets.chomp)
  end
end

interactive_menu