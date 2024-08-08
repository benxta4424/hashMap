require_relative './lib/hash_map'
require_relative './lib/linkedd_list'

test=HashMap.new

test.set('apple', 'red')
test.set('banana', 'yellow')
test.set('carrot', 'orange')
test.set('dog', 'brown')
test.set('elephant', 'gray')
test.set('frog', 'green')
test.set('grape', 'purple')
test.set('hat', 'black')
test.set('ice cream', 'white')
test.set('jacket', 'blue')
test.set('kite', 'pink')
test.set('lion', 'golden')
test.set('jabla', 'frita')

puts test

puts
puts "The load is:#{test.check_load}"


puts
puts test.get_key('lion')


puts
puts test.has?('laban')

puts
puts "The removed key's value is:#{test.remove_key('grape')}"

puts 
test.length


puts
test.get_all_keys

puts 
test.get_all_values


puts 
test.get_entries
#puts 
#test.clear

#puts test