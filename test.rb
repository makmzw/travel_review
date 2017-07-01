class MyError < StandardError; end

x = gets.to_i

begin
if x == 3
  raise MyError
end
p 100 / x
rescue => ex
puts "not 3!"
rescue => ex

p ex.message
p ex.class
puts "stopped!"
ensure
puts "--END--"
end
