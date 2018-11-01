def my_min(list) #O(n^2)
  smallest = list[0]
  list.each_with_index do |num1, idx1|
    list.each_with_index do |num2, idx2|
      next if idx1 == idx2
      smallest = num1 if num1 < num2 && num1 < smallest
    end
  end
  smallest
end

def my_min2(list) #O(n)
  smallest = list.pop
  list.each do |num|
    smallest = num if num < smallest
  end
  smallest
end

def largest_contiguous_subsum(list) #O(n^3)
  sub_arrays = []
  list.each_with_index do |num1, idx1|
    list.each_with_index do |num2, idx2|
      if idx2 >= idx1
        sub_arrays << list[idx1..idx2]
      end
    end
  end
  sub_arrays.map! {|subarray| subarray.reduce(:+)}
  sub_arrays.max
end

def largest_contiguous_subsum2(list) #O(n)?
  largest_sum = 0
  sub_sum = 0
  i = 0
  j = 0
  while i < list.length
    sub_sum += list[i]
    if sub_sum >= largest_sum
      largest_sum = sub_sum
    end
    if i == list.length - 1
      j = j + 1
      i = j
      sub_sum = 0
    end
    i += 1
  end
  largest_sum
end

def largest_contiguous_subsum3(list) #O(n)
  largest_sum = list[0]
  sub_sum = 0
  list.each do |num|
    sub_sum += num
    if sub_sum <= largest_sum && sub_sum < 0
      sub_sum = 0
    elsif sub_sum > largest_sum
      largest_sum = sub_sum 
    end
  end
  largest_sum
end