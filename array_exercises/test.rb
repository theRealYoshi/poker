def transpose(arr)
  return [] if arr.empty?
  temp = arr.shift

  temp.zip(transpose(arr))


end
