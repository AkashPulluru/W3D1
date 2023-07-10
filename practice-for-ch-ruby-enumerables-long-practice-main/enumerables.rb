require "byebug"

class Array 
    def my_each(&block)
        i = 0
        while i < self.length 
            block.call(self[i])
            i += 1 
        end 
        return self 
    end

    def my_select(&block)
        array = []
        self.my_each do |ele|
            if block.call(ele)
                array << ele 
            end 
        end 
        return array 
    end 

    def my_reject(&block)
        array = []
        self.my_each do |ele|
            if !block.call(ele)
                array << ele 
            end 
        end 
        return array 
    end 

    def my_any?(&block)
        self.my_each do |ele|
            if block.call(ele)
                return true
            end
        end
        false
    end

    def my_all?(&block)
        self.my_each do |ele|
            if !block.call(ele)
                return false
            end
        end
        true
    end

    def my_flatten
        if self.flatten == self
            return self 
        end 
        self.flatten.my_flatten 
    end 

    def my_zip(*arguments)
        array = Array.new(self.length) { Array.new(arguments.length + 1) }
        array.each_with_index do |sub_array, i|
            array[i][0] = self[i]
        end
        arguments.each_with_index do |arg, i|
            # debugger
            if array[i][i + 1] != nil
                array[i][i + 1] = arg[i]
            end
        end

        array
    end 

#     Write `my_zip` to take any number of arguments. It should return a new array
# containing `self.length` elements. Each element of the new array should be an
# array with a length of the input arguments + 1 and contain the merged elements
# at that index. If the size of any argument is less than `self`, `nil` is
# returned for that location.

end 

# return_value = [1, 2, 3].my_each do |num|
#     puts num
#    end.my_each do |num|
#     puts num
#    end
#    # => 1
#    #    2
#    #    3
#    #    1
#    #    2
#    #    3
   
#    p return_value  # => [1, 2, 3]

# a = [1, 2, 3]
# p a.my_select { |num| num > 1 } # => [2, 3]
# p a.my_select { |num| num == 4 } # => []

# a = [1, 2, 3]
# p a.my_reject { |num| num > 1 } # => [1]
# p a.my_reject { |num| num == 4 } # => [1, 2, 3]

# a = [1, 2, 3]
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false
# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true

# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

a = [ 4, 5, 6 ]
b = [ 7, 8, 9 ]
p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

c = [10, 11, 12]
d = [13, 14, 15]
p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]