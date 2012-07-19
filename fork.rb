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

10.times do
  fork do
    sleep rand * 2
    say "This is from the child"
  end
end

say "This happens while the children are running"

Process.waitall

say "This happens only after all the children are done"

say "And now let's try some more forks, to see if Process.waitall can handle it"

fork do
  say "Doing something in the child process"
  sleep 5
  say "Done in the child"
end

say "Waiting, from the parent, for the new child"

Process.waitall

say "And now we're done altogether"
