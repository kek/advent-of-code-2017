defmodule AdventOfCode2017.Captcha do
  def sum(number, jump) when is_integer(number) do
    number
    |> digit_list
    |> sum(jump)
  end

  def sum(digit_list, jump) when is_list(digit_list) do
    length = length(digit_list)
    numbers =
      digit_list
      |> Stream.cycle
      |> Enum.take(length)
    nexts =
      digit_list
      |> Stream.cycle
      |> Stream.drop(jump)
      |> Enum.take(length)

    numbers
    |> Enum.zip(nexts)
    |> Enum.filter(fn {number, next} -> number == next end)
    |> Enum.map(fn {number, next} -> number end)
    |> Enum.sum
  end

  defp digit_list(number) do
    number
    |> Integer.to_charlist
    |> Enum.map(fn x -> x - ?0 end)
  end
end
