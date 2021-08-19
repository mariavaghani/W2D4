# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers
def least_common_multiple(num_1, num_2)
    multiple = [num_1, num_2].max

    while (multiple % num_1 != 0) || (multiple % num_2 != 0)
        multiple += 1
    end
    multiple
end

# puts "result"
# p least_common_multiple(4, 10) # => 20
# puts "result"
# p least_common_multiple(7, 21) # => 21
# puts "result"
# p least_common_multiple(8, 12) # => 24



# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)

    all_bigrams = []
    (0...str.length-1).each { |start_idx| all_bigrams << str[start_idx..start_idx+1] }
    counts = Hash.new(0)
    all_bigrams.each { |ele| counts[ele] += 1 }
    counts.select { |k,v| v == counts.values.max }.keys[0]
end

# p most_frequent_bigram("thethrillofit") # ("th")
# p most_frequent_bigram("thethrillofitftllhrllth") # ("ll")


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        new_hash = {}
        self.each { |k, v| new_hash[v] = k }
        new_hash
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        count = 0
        self.each_with_index do |first, first_idx|
            self.each_with_index do |second, second_idx|
                if second_idx > first_idx
                    count += 1 if first + second == num
                end
            end
        end
        count
    end

    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    #
    # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
    # two parameters, which represents the two elements in the array being compared.
    # If the block returns 1, it means that the second element passed to the block
    # should go before the first (i.e. switch the elements). If the block returns -1,
    # it means the first element passed to the block should go before the second
    # (i.e. do not switch them). If the block returns 0 it implies that
    # it does not matter which element goes first (i.e. do nothing).
    #
    # This should remind you of the spaceship operator! Convenient :)
    def bubble_sort(&prc)
        prc ||= Proc.new { |a,b| a <=> b }

        sorted = false
        while !sorted
            sorted = true
            (0...self.length-1).each do |idx|
                if prc.call(self[idx], self[idx+1]) == 1
                    self[idx], self[idx+1] = self[idx+1], self[idx] 
                    sorted = false
                end
            end 
        end
        self
    end
end

# p arr = [4, 5, 23, 26, 213, 0]
# arr.bubble_sort
# p arr