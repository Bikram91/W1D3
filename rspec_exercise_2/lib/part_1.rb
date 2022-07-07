def partition(arr, num)
  new_arr1 = []
  new_arr2 = []
  arr.each do |ele|
    if ele < num
      new_arr1 << ele
    else
      new_arr2 << ele
    end
  end
  [new_arr1, new_arr2]
end

def merge(hash1, hash2)
  new_hash = {}
  hash1.each { |k, v| new_hash[k] = v }
  hash2.each { |k, v| new_hash[k] = v }
  new_hash
end

def censor(sent, arr)
  new_arr = sent.split(" ")
  new_sent = new_arr.map do |word|
    if arr.include?(word.downcase)
      vowel_star(word)
    else
      word
    end
  end
  new_sent.join(" ")
end

def vowel_star(word)
  new_word = ""
  vowels = "aeiouAEIOU"
  word.each_char do |char|
    if vowels.include?(char)
      new_word += "*"
    else
      new_word += char
    end
  end
  new_word
end

def power_of_two?(num)
  if num == 1
    return true
  end
  result = num
  new_num = result.even?
  while new_num
    result = result / 2
    new_num = result.even?
    if result == 2
      return true
    end
  end
  return false
end
