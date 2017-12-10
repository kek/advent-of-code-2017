defmodule AdventOfCode2017.Day3Test do
  use ExUnit.Case
  alias AdventOfCode2017.Distance

  describe "Distance.distance" do
    test "distance from 1" do
      assert Distance.distance(1) == 0
    end

    test "distance from 12" do
      assert Distance.distance(12) == 3
    end

    test "distance from 23" do
      assert Distance.distance(23) == 3
    end

    test "distance from 1024" do
      assert Distance.distance(1024) == 3
    end
  end
end
