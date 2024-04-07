# Doing this one recursively is a bit tricky in that it requires either 2 recursive methods or 1 recursive method that also has a loop in it. At least that's the only way I can imagine it.

# I'd probably start with finding a way to take two sorted arrays and & combine them into a single sorted array. For me it was easier to do this with a loop and rewrite it as a recursive method afterwards. The loop was more clear to understand.

# Array#shift can be quite helpful here

def merge(left_arr, right_arr)
  i = 0
  j = 0
  new_array = []

  left_arr = left_arr.sort
  right_arr = right_arr.sort

  until new_array.count == (left_arr.count + right_arr.count)
    if left_arr[i] == nil
      new_array << right_arr.last
    elsif right_arr[j] == nil
      new_array << left_arr.last
    else
      if left_arr[i] < right_arr[j]
        new_array << left_arr[i]
        i += 1
      else
        new_array << right_arr[j]
        j += 1
      end
    end
  end
  new_array
end

# p merge([3, 2, 1, 13, 8, 5, 0, 1])
# p merge([105, 79, 100, 110])

# def merge_sort(arr, new_array = [])
#   left_arr, right_arr = arr.slice!(0, arr.length/2), arr

#   return new_array if new_array.count  == left_arr.count + right_arr.count

#   new_array = merge(left_arr, right_arr)

#   merge_sort(new_array)
# end

# p merge_sort([3, 2, 1, 13, 8, 5, 0, 1])
# p merge_sort([105, 79, 100, 110])

# I think you might be confusing which part of the function is recursive.
# There are two steps to merge sort: sorting the left and right half (what you have as left_arr.sort etc.)
# and then merging them, usually with a helper function called merge(left, right).
# It is completely fine to do the merging part iteratively as you did.
# The recursion should happen with sorting, that is you should call your mergeSort method instead of the built-in Array#sort
#
# As to the high/low params, I don't know which video that is, but I'd guess it's because they're doing it in a low level language like C++ and trying to save memory by using the space allocated to the original array. I don't think you have to worry about that here.


def merge_sort(array)
  # base case
  return array if array.length < 2

  middle = array.length / 2
  # sort left
  left_half = merge_sort(array[0...middle])
  # sort right
  right_half = merge_sort(array[middle..array.length])
  # merge two halves(sort)

  sorted = []
  # compare until one half is empty
  until left_half.empty? || right_half.empty?
    # one pointer in each half comparing their current values
    # smaller values pushed to the sorted array
    left_half.first <= right_half.first ? sorted << left_half.shift : sorted << right_half.shift
  end

  sorted + left_half + right_half
end

p merge_sort([3, 4, 2, 1, 5, 0, 7, 10, 9, 7, 8, 6])
