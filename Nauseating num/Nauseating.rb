def strange_sums(arr)
    count = 0
    arr.each_with_index do |num1, i1|
        arr.each_with_index do |num2, i2|
            if (i2 > i1) && (num1 + num2 == 0)
                count +=1
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


def pair_product(arr, product)
    arr.each_with_index do |num1, i1|
        arr.each_with_index do |num2, i2|
            if (i2 > i1)
              if num1 * num2 == product
                return true
              else
                next
              end
            end
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


def perfect_square(num)
    if num == 1
        return true
    end
    (1...num).each do |factor|
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

def anti_prime?(num)
    new_arr1 = []
    (1...num).each do |factor|
        if num % factor == 0
            new_arr1 << factor
        end
    end
    new_arr1
    (1...num).each do |number|
        if divisor(number) > new_arr1.length
            return false
        end
    end
    true
end

def divisor(num)
    new_arr = []
    (1...num).each do |factor|
        if num % factor == 0
            new_arr << factor
        end
    end
        new_arr.length
end

#other method
def anti_prime?(num)
    (1...num).all? {|j| divisor(num) > divisor(j) }
end

def divisor(n)
    (1...n).count {|i| n % i == 0}
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

def matrix_addition(m1, m2)
    new_arr = []
    i = 0
    while i < m1.length
        sum = []
        j = 0
        while j < m1[0].length
            sum << m1[i][j] + m2[i][j]
            j+=1
        end
        new_arr << sum
        i+=1
    end
    new_arr
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


def mutual_factors(*num)
    i = 0
    while i < num.length
        factor(num[i]) 
        
        i+=1
    end
end

def factor(num)
    new_arr = []
    (1...num).each do |factor|
        if num % factor == 0
            new_arr << factor
        end
    end
    new_arr
end