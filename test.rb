def fib(n)
  return 1 if n == 1
  return 1 if n == 2

  fib(n-1) + fib(n-2)
end

# p fib(7)

def bubble_sort(arr, &prc)
  sorted = false
  while !sorted
    sorted = true

    (0...arr.length-1).each do |i|
      if prc.call(arr[i], arr[i+1]) == -1 
        arr[i], arr[i+1] = arr[i+1], arr[i]
        sorted = false
      end
    end
    
  end
  arr
end

p bubble_sort([6, 10, -5, 45, -89, 2]) { |a,b| a <=> b}

# to sort in alphabetical order
p (bubble_sort("kybrmh".split("")) do |a,b|
  alpha = ("a".."z").to_a
  alpha.index(a) <=> alpha.index(b)
end)