# Monkey-Patch Ruby's existing Array class to add your own custom methods
require "byebug"

class Array
    def span
        if self.length >= 1
            return self.max - self.min 
        else 
            return nil
        end
    end

    def average
        if !self.empty?
            return self.sum * 1.0 / self.length
        else
            return nil
        end
    end

    def median
        sorted = self.sort
        if self.empty?
            return nil
        elsif sorted.length.odd?
            middle = sorted.length / 2
            return sorted.sort[middle]
        elsif sorted.length.even?
            middles = []
            middle = sorted.length / 2
            middles << sorted[middle] 
            middles << sorted[middle - 1]
            middles.sum / 2.0
        end
    end

    def counts
        count = Hash.new(0)
        self.each {|ele| count[ele] += 1}
        return count
    end


    def my_count(value)
        count = Hash.new(0)
        self.each {|ele| count[ele] += 1}
        return count[value]
    end

    def my_index(item)
        self.each_with_index do |ele, idx|
            if ele == item
                return idx
            end
        end
        nil
    end

    def my_uniq
        elements = Hash.new(0)
        self.each {|ele| elements[ele] +=1 }
        elements.keys
    end

    def my_transpose
        new_array = []

        (0...self.length).each do |row|
            new_row = []

            (0...self.length).each do |col|
                new_row << self[col][row]
            end

            new_array << new_row
        end
        new_array
    end

end
