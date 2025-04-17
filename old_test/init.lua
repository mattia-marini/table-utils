-- Load the function under test
local function format(...)
  local result = {}
  for _, t in ipairs({ ... }) do
    for i = 1, #t do
      table.insert(result, t[i])
    end
  end
  return result
end

-- Helper to compare tables
local function table_equals(t1, t2)
  if #t1 ~= #t2 then return false end
  for i = 1, #t1 do
    if t1[i] ~= t2[i] then return false end
  end
  return true
end

-- Helper to run a single test
local function run_test(name, expected, f)
  local result = f()
  local pass = table_equals(result, expected)
  print((pass and "✅" or "❌") .. " " .. name)
  if not pass then
    print("Expected:", table.concat(expected, ", "))
    print("Got     :", table.concat(result, ", "))
  end
end
