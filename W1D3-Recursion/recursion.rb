# Exercise 1 - sum_to

def sum_to(n)
  return nil if n < 0
  return 1 if n == 1
  return n + sum_to(n-1) if n > 1
end

# Test Cases
puts sum_to(5)  # => returns 15
puts sum_to(1)  # => returns 1
puts sum_to(9)  # => returns 45
puts sum_to(-8)  # => returns nil

# Exercise 2 - add_numbers

def add_numbers(nums_array)
  return nil if nums_array.empty?
  return nums_array.pop if nums_array.length == 1
  return nums_array.pop + add_numbers(nums_array)
end

# Test Cases
puts add_numbers([1,2,3,4]) # => returns 10
puts add_numbers([3]) # => returns 3
puts add_numbers([-80,34,7]) # => returns -39
puts add_numbers([]) # => returns nil

# Exercise 3 - Gamma Function

def gamma_fnc(n)
  return nil if n == 0
  return 1 if n == 1
  return (n-1) * gamma_fnc(n-1)
end

# Test Cases
puts gamma_fnc(0)  # => returns nil
puts gamma_fnc(1)  # => returns 1
puts gamma_fnc(4)  # => returns 6
puts gamma_fnc(8)  # => returns 5040

# Exercise 4 - Ice Cream Shop

def ice_cream_shop(flavors, favorite)
  return false if flavors.empty?
  return true if flavors.pop == favorite
  return ice_cream_shop(flavors, favorite)
end

# Test Cases
puts ice_cream_shop(['vanilla', 'strawberry'], 'blue moon')  # => returns false
puts ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea')  # => returns true
puts ice_cream_shop(['cookies n cream', 'blue moon', 'superman', 'honey lavender', 'sea salt caramel'], 'pistachio')  # => returns false
puts ice_cream_shop(['moose tracks'], 'moose tracks')  # => returns true
puts ice_cream_shop([], 'honey lavender')  # => returns false

# Exercise 5 - Reverse

def reverse(string)
  return "" if string.length == 0
  return string if string.length == 1
  return string[-1] + reverse(string[0..-2])
end

# Test Cases
puts reverse("house") # => "esuoh"
puts reverse("dog") # => "god"
puts reverse("atom") # => "mota"
puts reverse("q") # => "q"
puts reverse("id") # => "di"
puts reverse("") # => ""
