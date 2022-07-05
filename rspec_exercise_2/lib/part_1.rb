def partition(arr, num)
    new_arr = []
    arr1 = []
    arr2 = []
    arr.each do |ele|
        if ele >= num
            arr2 << ele
        else
            arr1 << ele
        end
    end
    new_arr = arr1, arr2
end

def merge(hash1, hash2)
   hash = {}
    hash1.each do |k,v|
        hash[k] = v
    end
    hash2.each do |k,v|
        hash[k] = v
    end
    hash
end

def censor(sent, arr)
  new_arr = []
  arr1 = sent.split(" ")
  arr1.each_with_index do |ele, i|
    if arr.include?(ele.downcase)
      new_arr << replace1(ele) 
    else
      new_arr << ele
    end
    end
    new_arr.join(" ")
end
      
def replace1(word)
  new_str = ""
  vowels = "aeiou"
  word.each_char do |char|
    if vowels.include?(char.downcase)
      new_str += "*"
    else
    new_str += char
    end
  end
  new_str
end


def power_of_two?(num)
  if num == 1
    return true
  end
  even = true
        
  while even
    new_num = num/2 
    num = new_num
    if num.odd?
      return false
    end
    if num == 2
      return true
    end
  end
end




























