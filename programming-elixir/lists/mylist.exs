defmodule MyList do
  def len([]), do: 0
  def len([_head|tail]), do: 1 + len(tail)

  def square([]), do: []
  def square([head|tail]), do: [head*head|square(tail)]

  def map([], _func), do: []
  def map([head|tail], func), do: [func.(head) | map(tail, func)]

  def sum(list), do: _sum(list, 0)
  defp _sum([], total), do: total
  defp _sum([head|tail], total), do: _sum(tail, head + total)

  def sum2([]), do: 0
  def sum2([head|tail]), do: sum2(tail) + head

  def reduce([], value, _func), do: value
  def reduce([head|tail], value, func), do: reduce(tail, func.(head, value), func)

  def mapsum([], _func), do: 0
  def mapsum(list, func), do: map(list, func) |> sum

  def max([]), do: nil
  def max([max]), do: max
  def max([head|tail]), do: max(head, max(tail))

  def ceasar([], _n), do: []
  def ceasar([head|tail], n) when head+n <= ?z, do: [head + n | ceasar(tail, n)]
  def ceasar([head|tail], n), do: [head + n - 26 | ceasar(tail, n)]

  def span(from, from), do: [from]
  def span(from, to) when from <= to, do: [from | span(from + 1, to)]
  def span(from, to), do: [from | span(from - 1, to)]
end
