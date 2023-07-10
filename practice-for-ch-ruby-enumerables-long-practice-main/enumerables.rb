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

a = [1, 2, 3]
p a.my_any? { |num| num > 1 } # => true
p a.my_any? { |num| num == 4 } # => false
p a.my_all? { |num| num > 1 } # => false
p a.my_all? { |num| num < 4 } # => true