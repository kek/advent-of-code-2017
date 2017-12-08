defmodule AdventOfCode2017.Captcha do
  def sum(number) when is_integer(number) do
    l =
      number
      |> Integer.to_charlist
      |> Enum.map(fn x -> x - ?0 end)

    [i | _] = l

    sum(l, i)
  end

  defp sum([], _), do: 0
  defp sum([h], h), do: h
  defp sum([h|[h|t]], i), do: h + sum([h|t], i)
  defp sum([_|t], i), do: sum(t, i)
end
