require_relative "../config/environment.rb"

class Student

  attr_accessor :name, :grade
  attr_reader :id

  def initialize (name, grade, id = nil)
    @name = name
    @grade = grade
    @id = id
  end

  def self.create_table
    sql = <<-SQL
      CREATE TABLE IF NOT EXISTS students (
        id INTEGER PRIMAY KEY,
        name TEXT,
        grade INTEGER
      )
      SQL
      DB[:conn].execute(sql)
    end

    def self.drop_table
      sql = <<-SQL
        DROP TABLE students
        SQL
      DB[:conn].execute(sql)
    end

    def save 
      id self.id 

      sql = <<-SQL
        


      SQL


    end 



    

end
