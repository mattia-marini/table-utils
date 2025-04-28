local M = {}

--- Inserts the contents of the source table into the destination table at the specified index.
--- ```lua
--- insert_table({ 1, 2, 3 }, { 4, 5, 6 }, 2) --  {1, 4, 5, 6, 2, 3}
--- ```
--- @param dest table The destination table where elements will be inserted.
--- @param source table The source table whose elements will be inserted into the destination table.
--- @param index number The position in the destination table where the source table's elements will be inserted.
--- The element at `index` will end up at the right of the inserted elements.
--- @return table result A new table containing the combined elements of `dest` and `source`.
function M.insert_table(dest, source, index)
  local result = {}
  local insertion_point = math.min(#dest, index)
  for i = 1, insertion_point - 1 do
    table.insert(result, dest[i])
  end
  for _, v in ipairs(source) do
    table.insert(result, v)
  end
  for i = insertion_point, #dest do
    table.insert(result, dest[i])
  end
  return result
end

-- Tests
-- print(util.inspect(insert_table({ 1, 2, 3 }, { 4, 5, 6 }, 2)))
-- print(util.inspect(insert_table({}, { 4, 5, 6 }, 2)))
-- print(util.inspect(insert_table({}, { 4, 5, 6 }, -1)))
-- print(util.inspect(insert_table({}, { 4, 5, 6 }, 1)))
-- print(util.inspect(insert_table({ 1 }, { 4, 5, 6 }, 1)))
--
-- print(util.inspect(insert_table({ 1, 2, 3 }, {}, 2)))
-- print(util.inspect(insert_table({ 1, 2, 3 }, {}, -1)))
-- print(util.inspect(insert_table({ 1 }, {}, 1)))


--- Concatenates values from multiple tables into a single flat list.
--- ```lua
--- insert_table({ 1, 2}, { 3 }, {4,5}) --  {1, 2, 3, 4, 5}
--- ```
--- @param ... table Variadic number of tables containing array-like values.
--- @return table result A single table with all values concatenated in order.
function M.format(...)
  local result = {}

  -- Iterate over each table passed as argument
  for _, t in ipairs({ ... }) do
    -- Add each element of the current table to the result
    for i = 1, #t do
      table.insert(result, t[i])
    end
  end

  return result
end

local function split(dest, source, index)
end


return M
