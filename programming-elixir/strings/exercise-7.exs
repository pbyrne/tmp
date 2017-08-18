defmodule Tax do
  def calculate_from(path) do
    read(path) |> 
    # “You’ll need the library functions File.open, IO.read(file, :line), and IO.stream(file).”
    File.open!(path) |> (IO.read(&1, :lin
  end
end
