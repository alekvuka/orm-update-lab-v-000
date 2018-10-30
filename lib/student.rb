require_relative "../config/environment.rb"

require 'pry'

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
      if self.id
        sql = <<-SQL
        UPDATE students SET name = ?, grade = ? WHERE id = ?
        SQL
        DB[:conn].execute(sql, self.name, self.grade, self.id)

      else
        sql = <<-SQL
        INSERT iNTO students (name, grade)
        VALUES (?, ?)
        SQL
        DB[:conn].execute(sql, self.name, self.grade)
        @id = DB[:conn].execute("SELECT last_insert_rowid() FROM students")[0][0]
      end
    end

    def self.create(name, grade)
      student = Student.new(name, grade)
      student.save
      student
    end

    def self.new_from_db(row)
      student = Student.new(row[2], row[0], row[1])
      student
    end





end
