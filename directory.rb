require "CSV"

@students = []
@filename = "students.csv"

## MENU METHODS ##
def show_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "\n"
  puts "MENU".center(30, " -")
  puts "1. Add students"
  puts "2. Show the students"
  puts "3. Save this list of students"
  puts "4. Load a list of students"
  puts "9. Exit"
end

def process(menu_item)
  puts "You have selected #{menu_item}"
  case menu_item
  when "1" then get_students
  when "2" then print_students_list
  when "3" then save_students
  when "4" then load_students
  when "9" then exit 
  else
    puts "I don't know what you meant, please try again"
  end
end

## SHOWING STUDENT LIST METHODS ##
def print_header
  puts "\n\nThe students of Villians Academy"
  puts "-".center(30, " -")
end

def print_students_list
  @students.each_with_index do |student, index|
    puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
    puts "Overall, we have #{@students.count} great student#{"s" unless @students.count == 1}.\n\n\n"
end 

def print_students
  print_header
  print_students_list
  print_footer
end

## ADD (STAGE) STUDENTS METHODS ##
def get_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp

  while !name.empty? do
    add_students(name, "november")
    puts "Now we have #{@students.count} student#{"s" unless @students.count == 1}"
    name = STDIN.gets.chomp
  end
end

def add_students(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

## LOAD & SAVE STUDENTS METHODS ##
def load_students_at_startup
  filename = ARGV.first || filename = @filename
  return if filename.nil?
  if File.exist?(filename)
    load_students(filename)
  else 
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def load_students(filename
  file = File.open(filename, "r").readlines.each do |line|
    name, cohort = line.chomp.split(',')
    add_students(name, cohort)
  end
  puts "Loaded #{@students.count} from #{filename}"
end

def save_students
  CSV.open(@filename, "w") do |file|
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      file << student_data
    end
  end
  puts "Saved students to #{@filename}"
end

## RUN ##
load_students_at_startup
show_menu