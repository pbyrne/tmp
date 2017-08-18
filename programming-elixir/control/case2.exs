dave = %{ name: "Dave", age: 27 }

case dave do
  person = %{age: age} when is_number(age) and age >= 21 ->
    IO.puts "Yo are cleared to enter Foo Bar, #{person.name}"
  _ ->
    IO.puts "Sorry, no admission"
end
