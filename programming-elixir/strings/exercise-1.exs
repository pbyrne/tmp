defmodule MyString do
  @space 32
  @tilde 126
  def is_only_printable?([]), do: false
  def is_only_printable?(list) do
    Enum.all?(list, &(Enum.member?(@space..@tilde, &1)))
  end

  def is_anagram(charlist1, charlist2) do
    charlist1 -- charlist2 == [] && charlist2 -- charlist1 == []
  end
end
