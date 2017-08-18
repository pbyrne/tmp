defmodule MyString do
  def capitalize_sentences(""), do: ""
  def capitalize_sentences(str) when is_binary(str), do: _capitalize_sentences(str)

  defp _capitalize_sentences(str) do
    str |> String.split(". ") |> Enum.map(&String.capitalize(&1)) |> Enum.join(". ")
  end
end
