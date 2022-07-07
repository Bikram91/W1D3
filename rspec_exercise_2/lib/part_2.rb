def palindrome?(str)
  reverse = ""
  i = str.length - 1
  while i >= 0
    reverse += str[i]
    i -= 1
  end
  return true if reverse == str
  false
end

def substrings(str)
  arr = []
  new_str = ""
  i = 0
  while i < str.length
    j = i
    while j < str.length
      arr << str[i..j]
      j += 1
    end
    i += 1
  end
  arr
end

def palindrome_substrings(str)
  arr = []
  substrings(str).each do |ele|
    if palindrome?(ele) && ele.length > 1
      arr << ele
    end
  end
  arr
end
