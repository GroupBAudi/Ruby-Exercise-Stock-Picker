def stock_picker(stock)
  # iterate through the array, compare current index with the highest value that's only to the RIGHT
  # store result in hash, sort it (turns into array) and pick out the most profitable one
  result = {}
  len = stock.length

  stock.map.with_index do |curr, i|
    if stock[i + 1] == nil
      break
    end
    new_day_stock = stock.slice(i + 1, len) # sliced into [3,6,9,15, ...] then [6,9,15,8, ... ] and so on so it does not compare to it self (17 to 17 at index 0)
    result[[i, stock.index(new_day_stock.max)]] = new_day_stock.max - curr
  end
  return result.sort_by(&:last)[-1][0]
end

case_1 = [17,3,6,9,15,8,6,1,10]
p stock_picker(case_1)

# expected:       buy   sell
# stock_picker([17,3,6,9,15,8,6,1,10])
#=> [1,4]  # for a profit of $15 - $3 == $12