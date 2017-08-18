defmodule OK do
  def ok!({:ok, data}), do: data
end

IO.puts OK.ok! {:error, "foo"}
