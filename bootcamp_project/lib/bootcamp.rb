class Bootcamp
    def initialize(name="Map Academy", slogan="Anyone can be a cartographer", student_capacity="6")
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity
        @teachers = []
        @students = []
        @grades = Hash.new { |hash, k| hash[k] = [] }
    end

    def name
        @name
    end

    def slogan
        @slogan
    end

    def teachers
        @teachers
    end

    def students
        @students
    end

    def hire(str)
        @teachers.push(str)
    end

    def enroll(str)
        if @students.length < @student_capacity
            @students.push(str)
            return true
        else
            return false
        end
    end

    def enrolled?(str)
        @students.include?(str)
    end

    def student_to_teacher_ratio
        @students.length / @teachers.length
    end

    def add_grade(str, num)
        if @students.include?(str)
            @grades[str].push(num)
            return true
        else
            return false
        end
    end

    def num_grades(str)
        @grades[str].length
    end

    def average_grade(str)
        return nil if num_grades(str) < 1 || !enrolled?(str)
        @grades[str].sum / @grades[str].length
    end


end
