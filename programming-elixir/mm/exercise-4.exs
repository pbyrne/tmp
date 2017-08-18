defmodule Sum do
  def to(1), do: 1
  def to(n), do: n + to(n - 1)
end
