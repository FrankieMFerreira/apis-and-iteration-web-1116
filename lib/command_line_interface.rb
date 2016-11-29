def welcome
  puts "Hi"
end

def get_character_from_user
  puts "please enter a character"
  name = gets.chomp
  name.downcase
  # use gets to capture the user's input. This method should return that input, downcased.
end
