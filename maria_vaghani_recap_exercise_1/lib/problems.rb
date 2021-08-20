# Write a method, all_vowel_pairs, that takes in an array of words and returns all pairs of words
# that contain every vowel. Vowels are the letters a, e, i, o, u. A pair should have its two words
# in the same order as the original array. 
#
# Example:
#
def all_vowel_pairs(words)
    vowels = ["e", "a", "i", "o", "u"]
    result = []
    words.each_with_index do |first_word, first_word_idx|
        words.each_with_index do |second_word, second_word_idx|
            str = first_word + " " + second_word
            if second_word_idx > first_word_idx && (str.split("") & vowels).length == vowels.length
                result << str
            end
        end
    end
    result
end

# p all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])   # => ["action europe", "tear impromptu"]

# Write a method, composite?, that takes in a number and returns a boolean indicating if the number
# has factors besides 1 and itself
#
# Example:
#
def composite?(num)
    return false if num <= 1
    (2...num).any? { |factor| num % factor == 0 }
end

# p composite?(9)     # => true
# p composite?(13)    # => false
# p composite?(-6)    # => false?
# p composite?(1)    # => false
# p composite?(2)    # => false


# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the the order they appear in the original array.
#
# Examples:
#
def find_bigrams(str, bigrams)
    result = []
    bigrams.each do |bigram|
        test = str.split(bigram)
        result << bigram if test.length > 1 || test[0].length != str.length
    end
    result
end

# str = "ha"
# another_str = "to the moon and back"

# p another_str.split(str) 
# p find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]
# p find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]


class Hash
    # Write a method, Hash#my_select, that takes in an optional proc argument
    # The method should return a new hash containing the key-value pairs that return
    # true when passed into the proc.
    # If no proc is given, then return a new hash containing the pairs where the key is equal to the value.
    #
    # Examples:
    #
    def my_select(&prc)
        prc ||= Proc.new { |k, v| k == v }
        new_hash = {}
        self.each { |k, v| new_hash[k] = v if prc.call(k,v)}
        new_hash
    end
end
hash_1 = {x: 7, y: 1, z: 8}
p hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}

hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
p hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
p hash_2.my_select                            # => {4=>4}

class String
    # Write a method, String#substrings, that takes in a optional length argument
    # The method should return an array of the substrings that have the given length.
    # If no length is given, return all substrings.
    #
    # Examples:
    #
    def substrings(length = nil)
        result = []
        (0...self.length).each do |start_idx|
            (start_idx...self.length).each do |end_idx|
                result << self[start_idx..end_idx]
            end
        end
        if length
            result.select { |ele| ele.length == length }
        else
            result
        end
    end
    
    
    # Write a method, String#caesar_cipher, that takes in an a number.
    # The method should return a new string where each char of the original string is shifted
    # the given number of times in the alphabet.
    #
    # Examples:
    #
    def caesar_cipher(num)
        alpha = ("a".."z").to_a
        new_str = ""

        self.each_char do |char|
            old_idx = alpha.index(char)
            new_idx = (old_idx + num) % alpha.length
            new_str += alpha[new_idx]
        end
        new_str
    end
end

# p "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
# p "cats".substrings(2)  # => ["ca", "at", "ts"]
# p "apple".caesar_cipher(1)    #=> "bqqmf"
# p "bootcamp".caesar_cipher(2) #=> "dqqvecor"
# p "zebra".caesar_cipher(4)    #=> "difve"