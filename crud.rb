require 'pg'
require 'dotenv/load'

class Student
  attr_accessor :name, :class_id, :roll_no, :address, :contact

  def initialize(name, class_id, roll_no, address, contact)
    @name = name
    @class_id = class_id
    @roll_no = roll_no
    @address = address
    @contact = contact
  end

  def to_s
    "#{name}, #{class_id}, #{roll_no}, #{address}, #{contact}"
  end
end

class SchoolDatabase
    def initialize
      @connect_db = PG.connect(dbname: ENV['DBNAME'], user: ENV['DBUSER'], password: ENV['PASSWORD'], host:ENV['HOST'])
    end
  
    def add_student(student)
      @connect_db.exec_params('INSERT INTO student(name, address, contact, roll_no, class_id) VALUES ($1,$2,$3,$4,$5)',
                              [student.name, student.address, student.contact, student.roll_no, student.class_id])
      puts "Added new student: #{student}"
    end

    def display_students
      result = @connect_db.exec_params('SELECT name, address, contact, roll_no, class_id FROM student')
      result.each do |row|
        student = Student.new(row['name'], row['class_id'], row['roll_no'], row['address'], row['contact'])
        puts student
      end
    end

    def edit_student(id, address, contact)
      @connect_db.exec_params('UPDATE student SET address=$1, contact=$2 WHERE student_id=$3', [address, contact, id])
      puts "Updated address and contact of student having ID: #{id}"
    end

    def del_student(id)
      @connect_db.exec_params('DELETE FROM student WHERE student_id=$1', [id])
      puts "Deleted student of ID: #{id}"
    end
end

class School
    def initialize
      @database = SchoolDatabase.new
      menu
    end
  
    def add_student
      print 'Enter name:'
      name = gets.chomp
      print 'Enter class:'
      class_id = gets.chomp
      print 'Enter roll no.:'
      roll_no = gets.chomp
      print 'Enter address:'
      address = gets.chomp
      print 'Enter contact:'
      contact = gets.chomp
  
      student = Student.new(name, class_id, roll_no, address, contact)
      @database.add_student(student)
    end

    def display_students
      @database.display_students
    end

    def edit_student
      puts 'Enter the id of the student whose details you want to edit!'
      print 'Enter id:'
      id = gets.chomp
      print 'Edit address:'
      address = gets.chomp
      print 'Change Contact:'
      contact = gets.chomp

      @database.edit_student(id, address, contact)
    end

    def del_student
      puts 'Enter the id of the student whose details you want to delete!'
      print 'Enter id:'
      id = gets.chomp

      @database.del_student(id)
    end

    def menu
      puts "Hello! How can I help?\n1.ADD NEW STUDENT\n2.READ\n3.UPDATE STUDENT\n4.DELETE"
      menu = gets.chomp
      case menu
      when '1'
        add_student
      when '2'
        display_students
      when '3'
        edit_student
      when '4'
        del_student
      else
        puts 'No such option found'
      end
    end
end

School.new