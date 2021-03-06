# Write a method strange_sums that accepts an array of numbers as an argument. The method should return a count of the number of distinct pairs of elements that have a sum of zero. You may assume that the input array contains unique elements.

def strange_sums(arr)
  count = 0
  arr.each_with_index do |ele1, i1|
    arr.each_with_index do |ele2, i2|
      if i2 > i1 && (ele1 + ele2) == 0
        count += 1
      end
    end
  end
  count
end

# p strange_sums([2, -3, 3, 4, -2])     # 2
# p strange_sums([42, 3, -1, -42])      # 1
# p strange_sums([-5, 5])               # 1
# p strange_sums([19, 6, -3, -20])      # 0
# p strange_sums([9])                   # 0

# Write a method pair_product that accepts an array of numbers and a product as arguments. The method should return a boolean indicating whether or not a pair of distinct elements in the array result in the product when multiplied together. You may assume that the input array contains unique elements.

def pair_product(arr, product)
  arr.each_with_index do |ele1, i1|
    arr.each_with_index do |ele2, i2|
      return true if (i2 > i1) && (ele1 * ele2 == product)
    end
  end
  false
end

# p pair_product([4, 2, 5, 8], 16)    # true
# p pair_product([8, 1, 9, 3], 8)     # true
# p pair_product([3, 4], 12)          # true
# p pair_product([3, 4, 6, 2, 5], 12) # true
# p pair_product([4, 2, 5, 7], 16)    # false
# p pair_product([8, 4, 9, 3], 8)     # false
# p pair_product([3], 12)             # false

# Write a method rampant_repeats that accepts a string and a hash as arguments. The method should return a new string where characters of the original string are repeated the number of times specified by the hash. If a character does not exist as a key of the hash, then it should remain unchanged.

def rampant_repeats(str, hash)
  new_str = ""
  str.each_char do |char|
    if hash.has_key?(char)
      new_str += char * hash[char]
    else
      new_str += char
    end
  end
  new_str
end

# p rampant_repeats('taco', {'a'=>3, 'c'=>2})             # 'taaacco'
# p rampant_repeats('feverish', {'e'=>2, 'f'=>4, 's'=>3}) # 'ffffeeveerisssh'
# p rampant_repeats('misispi', {'s'=>2, 'p'=>2})          # 'mississppi'
# p rampant_repeats('faarm', {'e'=>3, 'a'=>2})            # 'faaaarm'

#Write a method perfect_square? that accepts a number as an argument. The method should return a boolean indicating whether or not the argument is a perfect square. A perfect square is a number that is the product of some number multiplied by itself. For example, since 64 = 8 * 8 and 144 = 12 * 12, 64 and 144 are perfect squares; 35 is not a perfect square.

def perfect_square(num)
  (1..num).each do |factor|
    if factor * factor == num
      return true
    end
  end
  false
end

# p perfect_square(1)     # true
# p perfect_square(4)     # true
# p perfect_square(64)    # true
# p perfect_square(100)   # true
# p perfect_square(169)   # true
# p perfect_square(2)     # false
# p perfect_square(40)    # false
# p perfect_square(32)    # false
# p perfect_square(50)    # false

#Write a method anti_prime? that accepts a number as an argument. The method should return true if the given number has more divisors than all positive numbers less than the given number. For example, 24 is an anti-prime because it has more divisors than any positive number less than 24.

def anti_prime?(num)
  num_factors = fac(num)
  (2...num).each do |j|
    return false if num_factors <= fac(j)
  end
  true
end

def fac(num1)
  (2..num1).count do |factor|
    num1 % factor == 0
  end
end

# p anti_prime?(24)   # true
# p anti_prime?(36)   # true
# p anti_prime?(48)   # true
# p anti_prime?(360)  # true
# p anti_prime?(1260) # true
# p anti_prime?(27)   # false
# p anti_prime?(5)    # false
# p anti_prime?(100)  # false
# p anti_prime?(136)  # false
# p anti_prime?(1024) # false

#Let a 2-dimensional array be known as a "matrix". Write a method matrix_addition that accepts two matrices as arguments. The two matrices are guaranteed to have the same "height" and "width". The method should return a new matrix representing the sum of the two arguments. To add matrices, we simply add the values at the same positions:

def matrix_addition(m1, m2)
  height = m1.length
  width = m1[0].length
  matrix = Array.new(height) { Array.new(width, 0) }
  row = 0
  while row < height
    column = 0
    while column < width
      matrix[row][column] = m1[row][column] + m2[row][column]
      column += 1
    end
    row += 1
  end
  matrix
end

# matrix_a = [[2,5], [4,7]]
# matrix_b = [[9,1], [3,0]]
# matrix_c = [[-1,0], [0,-1]]
# matrix_d = [[2, -5], [7, 10], [0, 1]]
# matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
# p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
# p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
# p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]

# Write a method mutual_factors that accepts any amount of numbers as arguments. The method should return an array containing all of the common divisors shared among the arguments. For example, the common divisors of 50 and 30 are [1, 2, 5, 10]. You can assume that all of the arguments are positive integers.

def mutual_factors(*num)
  arr = []
  (1..num.min).each do |factor|
    flag = true
    num.each do |ele|
      if ele % factor != 0
        flag = false
        break
      end
    end
    if flag
      arr << factor
    end
  end
  arr
end

# p mutual_factors(50, 30)            # [1, 2, 5, 10]
#  p mutual_factors(50, 30, 45, 105)   # [1, 5]
# p mutual_factors(8, 4)              # [1, 2, 4]
# p mutual_factors(8, 4, 10)          # [1, 2]
# p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
# p mutual_factors(12, 24, 64)        # [1, 2, 4]
# p mutual_factors(22, 44)            # [1, 2, 11, 22]
# p mutual_factors(22, 44, 11)        # [1, 11]
# p mutual_factors(7)                 # [1, 7]
# p mutual_factors(7, 9)              # [1]

# Write a method tribonacci_number that accepts a number argument, n, and returns the n-th number of the tribonacci sequence.

def tribonacci_number(num)
  if num == 1 || num == 2
    return 1
  end

  arr = [1, 1, 2]
  while arr.length < num
    arr << arr[-1] + arr[-2] + arr[-3]
  end
  arr[-1]
end

# p tribonacci_number(1)  # 1
# p tribonacci_number(2)  # 1
# p tribonacci_number(3)  # 2
# p tribonacci_number(4)  # 4
# p tribonacci_number(5)  # 7
# p tribonacci_number(6)  # 13
# p tribonacci_number(7)  # 24
# p tribonacci_number(11) # 274

# Write a method matrix_addition_reloaded that accepts any number of matrices as arguments. The method should return a new matrix representing the sum of the arguments. Matrix addition can only be performed on matrices of similar dimensions, so if all of the given matrices do not have the same "height" and "width", then return nil.

# def matrix_addition_reloaded(*m)
#   matrix = m.first
#   height = matrix.length
#   width = matrix[0].length
#   new_matrix = Array.new(heigth) {Array.new(width, [0])}

# end

# matrix_a = [[2,5], [4,7]]
# matrix_b = [[9,1], [3,0]]
# matrix_c = [[-1,0], [0,-1]]
# matrix_d = [[2, -5], [7, 10], [0, 1]]
# matrix_e = [[0 , 0], [12, 4], [6,  3]]

# matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
# p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
# p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
# p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil

# Write a method squarocol? that accepts a 2-dimensional array as an argument. The method should return a boolean indicating whether or not any row or column is completely filled with the same element. You may assume that the 2-dimensional array has "square" dimensions, meaning it's height is the same as it's width.

def squarocol?(arr)
  square(arr)
  arr = arr.transpose
  square(arr)
end

def square(arr)
  arr.each do |subarr|
    if subarr.uniq.length == 1
      return true
    end
  end
  false
end

# p squarocol?([
# [:a, :x, :d],
# [:b, :x, :e],
# [:c, :x, :f]
# ]) # true

# p squarocol?([
#   [:x, :y, :x],
#   [:x, :z, :x],
#   [:o, :o, :o],
# ]) # true

# p squarocol?([
#   [:o, :x, :o],
#   [:x, :o, :x],
#   [:o, :x, :o],
# ]) # false

# p squarocol?([
#   [1, 2, 2, 7],
#   [1, 6, 6, 7],
#   [0, 5, 2, 7],
#   [4, 2, 9, 7],
# ]) # true

# p squarocol?([
#   [1, 2, 2, 7],
#   [1, 6, 6, 0],
#   [0, 5, 2, 7],
#   [4, 2, 9, 7],
# ]) # false

#Write a method squaragonal? that accepts 2-dimensional array as an argument. The method should return a boolean indicating whether or not the array contains all of the same element across either of its diagonals. You may assume that the 2-dimensional array has "square" dimensions, meaning it's height is the same as it's width.

def squaragonal?(arr)
  return l_r(arr) || r_l(arr)
end

def l_r(arr)
  (0...arr.length).each do |i|
    if arr[0][0] == arr[i][i]
      next
    else
      return false
    end
  end
  true
end

def r_l(arr)
  (0...arr.length).each do |i|
    row = i
    col = (arr.length - 1) - i
    if arr[0][-1] == arr[row][col]
      next
    else
      return false
    end
  end
  true
end

#   p squaragonal?([
#     [:x, :y, :o],
#     [:x, :x, :x],
#     [:o, :o, :x],
# ]) # true

# p squaragonal?([
#     [:x, :y, :o],
#     [:x, :o, :x],
#     [:o, :o, :x],
# ]) # true

# p squaragonal?([
#     [1, 2, 2, 7],
#     [1, 1, 6, 7],
#     [0, 5, 1, 7],
#     [4, 2, 9, 1],
# ]) # true

# p squaragonal?([
#     [1, 2, 2, 5],
#     [1, 6, 5, 0],
#     [0, 2, 2, 7],
#     [5, 2, 9, 7],
# ]) # false

# Pascal's triangle is a 2-dimensional array with the shape of a pyramid. The top of the pyramid is the number 1. To generate further levels of the pyramid, every element is the sum of the element above and to the left with the element above and to the right. Nonexisting elements are treated as 0 when calculating the sum. For example, here are the first 5 levels of Pascal's triangle:
#     1
#    1 1
#   1 2 1
#  1 3 3 1
# 1 4 6 4 1

# Write a method pascals_triangle that accepts a positive number, n, as an argument and returns a 2-dimensional array representing the first n levels of pascal's triangle.

def pascals_triangle(num)
  arr = [[1]]
  while arr.length < num
    new_arr = [1]
    new_arr += sum(arr[-1])
    new_arr << 1
    arr << new_arr
  end
  arr
end

def sum(arr)
  add = []
  i = 0
  while i < arr.length - 1
    add << arr[i] + arr[i + 1]
    i += 1
  end
  add
end

# p pascals_triangle(5)
# # [
# #     [1],
# #     [1, 1],
# #     [1, 2, 1],
# #     [1, 3, 3, 1],
# #     [1, 4, 6, 4, 1]
# # ]

# p pascals_triangle(7)
# # [
# #     [1],
# #     [1, 1],
# #     [1, 2, 1],
# #     [1, 3, 3, 1],
# #     [1, 4, 6, 4, 1],
# #     [1, 5, 10, 10, 5, 1],
# #     [1, 6, 15, 20, 15, 6, 1]
# # ]

# Write a method mersenne_prime that accepts a number, n, as an argument and returns the n-th Mersenne prime.

def mersenne_prime(num)
  arr = []
  i = 0
  while arr.length < num
    i += 1
    num1 = 2 ** i - 1
    arr << num1 if prime?(num1)
  end
  arr[-1]
end

def prime?(num)
  return false if num < 2
  (2...num).none? { |factor| num % factor == 0 }
end

# p mersenne_prime(1) # 3
# p mersenne_prime(2) # 7
# p mersenne_prime(3) # 31
# p mersenne_prime(4) # 127
# p mersenne_prime(6) # 131071

# Write a method triangular_word? that accepts a word as an argument and returns a boolean indicating whether or not that word's number encoding is a triangular number. You can assume that the argument contains lowercase letters.

def triangular_word?(word)
  arr = ("a".."z").to_a
  sum = 0
  word.each_char do |char|
    sum += arr.index(char) + 1
  end
  triangular_num?(sum)
end

def triangular_num?(num)
  i = 1
  while i <= num
    return true if (i * (i + 1)) / 2 == num
    i += 1
  end
  false
end

# p triangular_word?('abc')       # true
# p triangular_word?('ba')        # true
# p triangular_word?('lovely')    # true
# p triangular_word?('question')  # true
# p triangular_word?('aa')        # false
# p triangular_word?('cd')        # false
# p triangular_word?('cat')       # false
# p triangular_word?('sink')      # false

# Write a method consecutive_collapse that accepts an array of numbers as an argument. The method should return a new array that results from continuously removing consecutive numbers that are adjacent in the array. If multiple adjacent pairs are consecutive numbers, remove the leftmost pair first.

def consecutive_collapse(arr1)
  while arr1 != collapse(arr1)
    arr1 = collapse(arr1)
  end
  arr1
end

def collapse(arr)
  i = 0
  while i < arr.length - 1
    if arr[i] + 1 == arr[i + 1] || arr[i] == arr[i + 1] + 1
      return arr[0...i] + arr[i + 2..-1]
    end
    i += 1
  end
  arr
end

# p consecutive_collapse([3, 4, 1])                     # [1]
# p consecutive_collapse([1, 4, 3, 7])                  # [1, 7]
# p consecutive_collapse([9, 8, 2])                     # [2]
# p consecutive_collapse([9, 8, 4, 5, 6])               # [6]
# p consecutive_collapse([1, 9, 8, 6, 4, 5, 7, 9, 2])   # [1, 9, 2]
# p consecutive_collapse([3, 5, 6, 2, 1])               # [1]
# p consecutive_collapse([5, 7, 9, 9])                  # [5, 7, 9, 9]
# p consecutive_collapse([13, 11, 12, 12])              # []

# Write a method pretentious_primes that takes accepts an array and a number, n, as arguments. The method should return a new array where each element of the original array is replaced according to the following rules:

# when the number argument is positive, replace an element with the n-th nearest prime number that is greater than the element
# when the number argument is negative, replace an element with the n-th nearest prime number that is less than the element

def pretentious_primes(arr, num)
  arr.map { |ele| nearest(ele, num) }
end

def nearest(element, num)
  arr1 = []
  i = element
  if num > 0
    while arr1.length < num
      arr1 << i + 1 if prime?(i + 1)
      i += 1
    end
    return arr1[-1]
  else
    num = -num
    while arr1.length < num
      arr1 << i - 1 if prime?(i - 1)
      i -= 1
      if i < 2
        return nil
      end
    end
    return arr1[-1]
  end
end

p pretentious_primes([4, 15, 7], 1)           # [5, 17, 11]
p pretentious_primes([4, 15, 7], 2)           # [7, 19, 13]
p pretentious_primes([12, 11, 14, 15, 7], 1)  # [13, 13, 17, 17, 11]
p pretentious_primes([12, 11, 14, 15, 7], 3)  # [19, 19, 23, 23, 17]
p pretentious_primes([4, 15, 7], -1)          # [3, 13, 5]
p pretentious_primes([4, 15, 7], -2)          # [2, 11, 3]
p pretentious_primes([2, 11, 21], -1)         # [nil, 7, 19]
p pretentious_primes([32, 5, 11], -3)         # [23, nil, 3]
p pretentious_primes([32, 5, 11], -4)         # [19, nil, 2]
p pretentious_primes([32, 5, 11], -5)         # [17, nil, nil]
