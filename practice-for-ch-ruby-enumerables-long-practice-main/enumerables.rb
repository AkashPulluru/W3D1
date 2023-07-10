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
            if block.call(ele) == true 
                array << ele 
            end 
        end 
        return array 
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