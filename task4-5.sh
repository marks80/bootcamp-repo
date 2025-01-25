#!/bin/bash

# Task 4: Temperature Converter (Using Variables, Conditional Structure, Special Variables)

# Objective: Create a script that converts temperatures between Celsius and Fahrenheit based on user input. The script should handle invalid input gracefully.

# Details:

# Accept the temperature value and the desired conversion type (C for Celsius to Fahrenheit, F for Fahrenheit to Celsius).
# Use a conditional structure (if-else) to determine the conversion formula.
# Display the result and handle invalid input.


# Celsius -> Fahrenheit
convert_c_to_f() {
  local celsius=$1
  echo "scale=2; ($celsius * 9/5) + 32" | bc
}

# Fahrenheit -> Celsius
convert_f_to_c() {
  local fahrenheit=$1
  echo "scale=2; ($fahrenheit - 32) * 5/9" | bc
}


echo -n "Enter the temperature value: "
read temp

# Check if input is numeric
if ! [[ $temp =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
  echo "Error!Temperature value must be a number"
  exit 1
fi

echo -n "Enter conversion type ('C' for Celsius to Fahrenheit, 'F' for Fahrenheit to Celsius): "
read conversion_type

# conversion
if [[ $conversion_type == "C" || $conversion_type == "c" ]]; then
  result=$(convert_c_to_f $temp)
  echo "$temp degrees Celsius is equal to $result degrees Fahrenheit."
elif [[ $conversion_type == "F" || $conversion_type == "f" ]]; then
  result=$(convert_f_to_c $temp)
  echo "$temp degrees Fahrenheit is equal to $result degrees Celsius."
else
  echo "Invalid value entered.Please enter 'C'(Celsium) or 'F'(Farhenheit) and run script again."
  exit 1
fi

