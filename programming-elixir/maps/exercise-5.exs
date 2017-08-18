defmodule MyEnum do
  def all?(list), do: all?(list, &(!!&1))
  def all?([], _fun), do: true
  def all?([head|tail], fun) do
    if fun.(head) do
      all?(tail, fun)
    else
      false
    end
  end

  def each([], _fun), do: []
  def each([head|tail], fun) do
    [fun.(head)|each(tail, fun)]
  end

  def filter([], _fun), do: []
  def filter([head|tail], fun) do
    if fun.(head) do
      [head|filter(tail, fun)]
    else
      filter(tail, fun)
    end
  end

  def split([], _count), do: {list,[]}
  def split(list, 0), do: {[],[]}
  def split([head|tail], count) do

  end
end
