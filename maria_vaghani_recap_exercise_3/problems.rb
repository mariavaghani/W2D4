require "byebug"

# general problems

def no_dupes?(arr)
  no_dupes_arr = []
  arr.each_with_index do |ele, idx|
    no_dupes_arr << ele if !(arr[idx+1...arr.length].include?(ele)) && !(arr[0...idx].include?(ele))
  end
  no_dupes_arr
end

# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true])            # => []

def no_consecutive_repeats?(arr)
  arr[0...-1].each_with_index { |ele, idx| return false if ele == arr[idx+1] }
  true
end

# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true



def char_indices(str)
  hash = Hash.new { |h,k| h[k] = [] }
  str.each_char.with_index { |char, idx| hash[char] << idx }
  hash
end

# p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

def longest_streak(str)
  longest_streak = str[0]
  streak_to_check = str[0]

  (1...str.length).each do |idx|

    if str[idx] == str[idx-1]
      streak_to_check += str[idx]
    else
      streak_to_check = str[idx]
    end

    if streak_to_check.length >= longest_streak.length
      longest_streak = streak_to_check
    end

  end
  longest_streak
end


# p longest_streak('a')           # => 'a'
# p longest_streak('accccbbb')    # => 'cccc'
# p longest_streak('aaaxyyyyyzz') # => 'yyyyy'
# p longest_streak('aaabbb')      # => 'bbb'
# p longest_streak('abc')         # => 'c'

def prime?(num)
  return false if num < 2
  (2...num).all? { |factor| num % factor != 0 }
end


def bi_prime?(num)
  return false if num < 3
  (2..Math.sqrt(num).ceil).any? { |factor_1| num % factor_1 == 0 && prime?(factor_1) && prime?(num / factor_1)}
end

# p bi_prime?(14)   # => true
# p bi_prime?(22)   # => true
# p bi_prime?(25)   # => true
# p bi_prime?(94)   # => true
# p bi_prime?(24)   # => false
# p bi_prime?(64)   # => false
# p bi_prime?(11)   # => false
# p bi_prime?(2)   # => false

def vigenere_cipher(message, keys)
  alpha = ("a".."z").to_a
  key_seq = keys.dup

  while key_seq.length < message.length
    key_seq += keys
  end
  key_seq = key_seq[0...message.length]
  
  new_message = ""

  message.each_char.with_index do |char, idx|
    old_idx = alpha.index(char)
    new_idx = (old_idx + key_seq[idx]) % alpha.length
    new_message << alpha[new_idx]
  end

  new_message

end

# p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
# p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
# p vigenere_cipher("toerrishuman", [1,2,3])  # => "uqhstltjxncq"
# p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
# p vigenere_cipher("yawn", [5, 1])             # => "dbbo"


def vowel_rotate(str)
  vowels = "eaiou".split("")
  vowels_str = []

  str.each_char { |char| vowels_str << char if vowels.include? char }
  vowels_str.rotate!(-1)
  vow_id = 0
  str.each_char.with_index do |char,idx|
    if vowels.include?(char)
      str[idx] =  vowels_str[vow_id]
      vow_id += 1
    end
  end
  str
end

# p vowel_rotate('computer')      # => "cempotur"
# p vowel_rotate('oranges')       # => "erongas"
# p vowel_rotate('headphones')    # => "heedphanos"
# p vowel_rotate('bootcamp')      # => "baotcomp"
# p vowel_rotate('awesome')       # => "ewasemo"


class String
  
  def select(&prc)
    prc ||= Proc.new { |char| false }

    new_self = ""
    self.each_char { |char| new_self += char if prc.call(char) }
    new_self
  end

  def map!(&prc)
    
    self.each_char.with_index do |char, idx|
      self[idx] = prc.call(char, idx)
    end
  end

end

# p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
# p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
# p "HELLOworld".select          # => ""




# word_1 = "Lovelace"
# word_1.map! do |ch| 
#     if ch == 'e'
#         '3'
#     elsif ch == 'a'
#         '4'
#     else
#         ch
#     end
# end
# p word_1        # => "Lov3l4c3"

# word_2 = "Dijkstra"
# word_2.map! do |ch, i|
#     if i.even?
#         ch.upcase
#     else
#         ch.downcase
#     end
# end
# p word_2        # => "DiJkStRa"

# RECURSION

def multiply(a, b)
  return a if b == 1

  if (a >= 0 && b >= 0)
     a + multiply(a, b-1)
  elsif (a < 0) ^ (b < 0)
     -(a.abs + multiply(a.abs,b.abs-1))
  else
    -a + multiply(-a, -(b+1))
  end
end

# p multiply(3, 5)        # => 15
# p multiply(5, 3)        # => 15
# p multiply(2, 4)        # => 8
# p multiply(0, 10)       # => 0
# p multiply(-3, -6)      # => 18
# p multiply(3, -6)       # => -18
# p multiply(-3, 6)       # => -18

def lucas_sequence(n)
  return [] if n == 0
  return [2] if n == 1
  return [2, 1] if n == 2

  lucas_sequence(n-1) + [lucas_sequence(n-1).last + lucas_sequence(n-2).last]
end

# p lucas_sequence(0)   # => []
# p lucas_sequence(1)   # => [2]    
# p lucas_sequence(2)   # => [2, 1]
# p lucas_sequence(3)   # => [2, 1, 3]
# p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
# p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]



# def prime_factorization(num)
#   return [num] if prime?(num)
#   factor = 2
#   while factor <= num && num % factor != 0
#     factor += 1
#   end
#   [factor] + prime_factorization(num / factor)
# end

def prime_recursion?(num, factor)
  return false if num < 2
  return false if num % factor == 0
  return true if factor * factor > num

  prime_recursion?(num, factor + 1)
end

def prime_factorization(num)
  factor = 2
  return [num] if prime_recursion?(num,factor)
  while factor <= num && num % factor != 0
    factor += 1
  end
  # p factor
  [factor] + prime_factorization(num / factor)
end

# p prime_factorization(12)     # => [2, 2, 3]
# p prime_factorization(24)     # => [2, 2, 2, 3]
# p prime_factorization(25)     # => [5, 5]
# p prime_factorization(60)     # => [2, 2, 3, 5]
# p prime_factorization(7)      # => [7]
# p prime_factorization(11)     # => [11]
# p prime_factorization(2017)   # => [2017]