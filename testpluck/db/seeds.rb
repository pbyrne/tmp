User.destroy_all

names = %w(
  Bobby
  Sally
  Suzy
  Bill
  Gerald
  Helga
)
ages = Array(1..100)

100_000.times do
  name = names.sample

  User.create({
    name: name,
    email: "#{name.downcase}@example.com",
    age: ages.sample
  })
end

puts "#{User.count} users created!"
