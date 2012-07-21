def say message
  pid = Process.pid
  stamp = Time.now.strftime('%H:%M:%S.%L')
  puts "PID #{pid} : #{stamp} : #{message}"
end

say "Starting script"

# if fork
#   sleep 2
#   say "This is from the parent"
# else
#   say "This is from the child"
# end

servers = []

10.times do
  fork do
    sleep rand * 2
    value = rand(100)
    say "This is from the child. Random value of #{value} selected."
    servers << value
    say servers
  end
end

say "This happens while the children are running"
say "The current servers list is: #{servers}"

Process.waitall

say "This happens only after all the children are done"
say "The current servers list is: #{servers}"

