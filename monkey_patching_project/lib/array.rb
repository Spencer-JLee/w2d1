# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        return nil if self.length < 1

        self.max - self.min 
    end

    def average
        return nil if self.length < 1

        self.sum.to_f / self.length.to_f
    end

    def median
        return nil if self.length < 1

        if self.length % 2 == 1
            arr = self.sort
            arr[self.length / 2]
        else 
            arr = self.sort
            (arr[self.length / 2] + arr[self.length / 2 - 1]) / 2.0
        end
    end


    def counts
        hash = Hash.new(0)

        (0...self.length).each do |i|
            hash[self[i]] += 1
        end

        hash
    end

    def my_count(num)
        count = 0

        self.each do |n|
            count += 1 if n == num
        end
        
        count
    end

    def my_index(num)
        index = nil

        self.each_with_index do |n, i|
            if n == num
                index = i 
                break
            end
        end

        index
    end

    def my_uniq
        new_arr = []

        self.each do |n|
            new_arr.push(n) if !new_arr.include?(n)
        end
        
        new_arr
    end

    def my_transpose
        new_arr = Array.new(self.length) {Array.new(self[0].length)}

        self.each_with_index do |m, i|
            self[i].each_with_index do |n, j|
                new_arr[i][j] = self[j][i]
            end
        end

        new_arr
    end
end
