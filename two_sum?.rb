def bad_two_sum?(arr, target) #O(n^2)
  arr.each_with_index do |num1, idx1|
    arr.each_with_index do |num2, idx2|
      if idx2 > idx1 && num1 + num2 == target
        return true
      end
    end
  end
  false
end

def okay_two_sum?(arr, target) #O(nlogn)
  arr.each_with_index do |num, idx|
    new_arr = arr[0...num] + arr[num + 1..-1]
    return false if bsearch(new_arr, target - num) == nil
  end
  true
end


def bsearch(arr, new_target)
  return nil if arr.length == 0
  
  mid = arr.length / 2
  left = arr[0...mid]
  right = arr[mid + 1..-1]
  
  return mid if arr[mid] == new_target
  
  if arr[mid] > new_target
    bsearch(left, new_target)
  else
    return nil if bsearch(right, new_target) == nil
    bsearch(right, new_target) + mid + 1
  end
end


def two_sum?(arr, target)
  hash = Hash.new()
  arr.each do |num|
    difference = target - num
    return true if hash[difference]
    hash[num] = true
  end
  false
end



