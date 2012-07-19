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
