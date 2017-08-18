fizz_buzz = fn
  (0,0,_) -> "FizzBuzz"
  (0,_,_) -> "Fizz"
  (_,0,_) -> "Buzz"
  (_,_,a) -> a
end

fizz_buzz_n = fn
  (n) -> fizz_buzz.(rem(n,3), rem(n,5), n)
end

IO.puts fizz_buzz_n.(10)
IO.puts fizz_buzz_n.(11)
IO.puts fizz_buzz_n.(12)
IO.puts fizz_buzz_n.(13)
IO.puts fizz_buzz_n.(14)
IO.puts fizz_buzz_n.(15)
IO.puts fizz_buzz_n.(16)

