def palindrome?(str)
    reverse = ""
    i = str.length - 1
    while i >= 0
        reverse += str[i]
        i-=1
    end

    if reverse == str
        return true
    else
        false
    end
end

def substrings(str)
    arr = []
    (0...str.length).each do |i1|
        (i1...str.length).each do |i2|
            arr << str[i1..i2]
        end
    end
    arr
end

def palindrome_substrings(str1)
    new_arr1 = []
     substrings(str1).each do |ele|
       if palindrome?(ele) && ele.length > 1
                new_arr1 << ele
       end
      end
      new_arr1
  end










# def palindrome_substrings(str)
#     new_arr = []
#     new_str = ""
#      str.each_char.with_index do |char1, i1|
#        new_str = char1
#         str.each_char.with_index do |char2, i2|
#           if i2 > i1
#             new_str += char2
#             if new_str == new_str.reverse
#               new_arr << new_str
#             end
#           end
#         end
#        new_str = ""
#       end
#     new_arr
# end