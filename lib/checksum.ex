defmodule AdventOfCode2017.Checksum do
  def for_differences(list_of_lists) when is_list(list_of_lists) do
    list_of_lists
    |> Enum.map(&difference/1)
    |> Enum.sum
  end

  defp difference([]), do: 0
  defp difference([_]), do: 0
  defp difference(row) do
    sorted = Enum.sort(row)
    lowest = List.first(sorted)
    highest = List.last(sorted)
    highest - lowest
  end

  def for_divisibles(list_of_lists) when is_list(list_of_lists) do
    list_of_lists
    |> Enum.map(&quota_of_only_two_divisible_numbers/1)
    |> Enum.sum
  end

  def quota_of_only_two_divisible_numbers(row) do
    set = MapSet.new(row)
    quotas = Enum.flat_map set, fn item ->
      MapSet.delete(set, item)
      |> Enum.flat_map fn other ->
        if rem(item, other) == 0 do
          [item / other]
        else
          []
        end
      end
    end
    case quotas do
      [quota] -> quota
      divisibles -> raise "more than one divisible number: #{inspect divisibles}"
    end
  end
end
