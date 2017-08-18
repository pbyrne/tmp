defmodule MyString do
  def center([]), do: nil
  def center(list) do
    width = Enum.max(Enum.map(list, &String.length(&1)))
    left = div(width, 2)
    right = width - left
    IO.puts "Max width: #{width}, left: #{left}, right: #{right}"
    Enum.map(list, fn str -> String.pad_leading(str, left) end)
  end
end
