def windowed_max_range1(arr, range) #O(n^2)
  new_array = []
  arr.each_cons(range) { |arr| new_array << arr }
  current_max_range = nil
  new_array.each do |sub_arr|
    if current_max_range == nil || sub_arr.max - sub_arr.min > current_max_range
      current_max_range = sub_arr.max - sub_arr.min
    end
  end
  current_max_range
end

def windowed_max_range2(arr, range) #O(n^2)
  new_array = []
  arr.each_index do |idx1|
    arr.each_index do |idx2|
      new_array << arr[idx1...idx2] if idx2 = idx1 + range
    end
  end
  current_max_range = nil
  new_array.each do |sub_arr|
    if current_max_range == nil || sub_arr.max - sub_arr.min > current_max_range
      current_max_range = sub_arr.max - sub_arr.min
    end
  end
  current_max_range
end



