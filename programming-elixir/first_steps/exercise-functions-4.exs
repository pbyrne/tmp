prefix = fn (prefix_string) ->
  fn (body_string) ->
    "#{prefix_string} #{body_string}"
  end
end

mrs = prefix.("Mrs.")
IO.puts mrs.("Smith")
IO.puts prefix.("Elixir").("Rocks")
