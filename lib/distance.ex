defmodule AdventOfCode2017.Distance do
  def distance(1), do: 0
  def distance(square) do
    1 + distance_for_closest_neighbor(square)
  end

  defp distance_for_closest_neighbor(square) do
    square
    |> neighbors
    |> Enum.map(&distance/1)
    |> Enum.sort
    |> List.first
  end

  defp neighbors(square) do
    case square do
      1 -> [2,4,6,8]
      2 -> [11,3,1,9]
      3 -> [12,14,4,2]
      4 -> [3,15,5,1]
      12 -> [3]
    end
  end
end
