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
