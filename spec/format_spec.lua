local mymodule = require("table_utils")

describe("mymodule.add", function()
  it("normal non empty tables", function()
    assert.are.same(
      { 1, 2, 3, 4 },
      mymodule.format({ 1, 2 }, { 3, 4 })
    )
  end)

  it("Single table", function()
    assert.are.same(
      { 1, 2, 3 },
      mymodule.format({ 1, 2, 3 })
    )
  end)

  it("Multiple tables", function()
    assert.are.same(
      { 1, 2, 3, 4, 5, 6, 7 },
      mymodule.format({ 1, 2, 3 }, { 4, 5 }, { 6 }, {}, { 7 })
    )
  end)

  it("Empty input", function()
    assert.are.same(
      {},
      mymodule.format()
    )
  end)

  it("Only empty tables", function()
    assert.are.same(
      {},
      mymodule.format({}, {}, {})
    )
  end)

  it("One non-empty, rest empty", function()
    assert.are.same(
      { 42 },
      mymodule.format({}, { 42 }, {})
    )
  end)

  it("Different types", function()
    assert.are.same(
      { 1, "a", true, 3.14 },
      mymodule.format({ 1 }, { "a" }, { true }, { 3.14 })
    )
  end)

  it("Nested table as element", function()
    assert.are.same(
      { { 1, 2 } },
      mymodule.format({ { 1, 2 } })
    )
  end)
end)
