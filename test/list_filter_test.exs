defmodule ListFilterTest do
  use ExUnit.Case
  doctest ListFilter

  test "test empty list" do
    assert ListFilter.call([]) == 0
  end

  test "test numberlist" do
    assert ListFilter.call(["1", "2", "3", "4"]) == 2
  end

  test "test ramdom string list" do
    assert ListFilter.call(["1", "2", "3", "4", "5", "abc", "xgh"]) == 3
  end

  test "test ramdom type list" do
    assert ListFilter.call(["0", 1.1, "2", "3", 4, "5", "abc", :xgh]) == 3
  end
end
