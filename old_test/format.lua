local test = require("test")

test.run_test("Single table", { 1, 2, 3 },
  function()
    return test.format({ 1, 2, 3 })
  end)

test.run_test("Multiple tables", { 1, 2, 3, 4, 5, 6, 7 },
  function()
    return test.format({ 1, 2, 3 }, { 4, 5 }, { 6 }, {}, { 7 })
  end)

test.run_test("Empty input", {},
  function()
    return test.format()
  end)

test.run_test("Only empty tables", {},
  function()
    return test.format({}, {}, {})
  end)

test.run_test("One non-empty, rest empty", { 42 },
  function()
    return test.format({}, { 42 }, {})
  end)

test.run_test("Different types", { 1, "a", true, 3.14 },
  function()
    return test.format({ 1 }, { "a" }, { true }, { 3.14 })
  end)

test.run_test("Nested table as element", { { 1, 2 } },
  function()
    return test.format({ { 1, 2 } })
  end)
