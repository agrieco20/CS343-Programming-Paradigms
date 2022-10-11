=begin #comment
Name: Anthony Grieco
Class: CS343 Programming Paradigms
Language: Ruby
Date: 10/9/2022

Description: This program performs Dimensional Analysis calculations on data related to Time (s), Distance (m), and/or Mass (kg)
=end #comment

require_relative 'dimensioned_quantities'
require_relative 'dimensions'

#main
if __FILE__ == $0
  #Creates three Starter "Dimensional Analysis" objects (the third object always has the same dimensions as the first object to further demonstrate that when adding and subtracting Dimensional Analysis objects they must contain the same bases)
  dimensionalObject1 = Dimensioned_Quantities.new(4, 0, 0, 2)

  dimensionalObject2 = Dimensioned_Quantities.new(1, -1, 1, 1)

  dimensionalObject3 = Dimensioned_Quantities.new(3, dimensionalObject1.newQuantityDimension.dimensionTimeExp_Getter, dimensionalObject1.newQuantityDimension.dimensionDistanceExp_Getter, dimensionalObject1.newQuantityDimension.dimensionMassExp_Getter)

  puts "\nPre-Built Dimensional Analysis Objects (Examples):"

  puts "\n\"dimensionalObject1\" =>"
  puts dimensionalObject1

  puts "\n\"dimensionalObject2\" =>"
  puts dimensionalObject2

  puts "\n\"dimensionalObject3\" =>"
  puts dimensionalObject3

  puts("- - - - - - -\n")
  #Addition Examples
  puts "Addition Example (without Matching Bases):"
  begin
    puts dimensionalObject1 + dimensionalObject2
  rescue ArgumentError => argument_error
    puts argument_error.message
  end

  puts("- - - - - - -\n")
  puts "Addition Example (with Matching Bases):"
  begin
    puts dimensionalObject1 + dimensionalObject3
  rescue ArgumentError => argument_error
    puts argument_error.message
  end

  #Subtraction Examples
  puts("- - - - - - -\n")
  puts "Subtraction Example (without Matching Bases):"
  begin
    puts dimensionalObject1 - dimensionalObject2
  rescue ArgumentError => argument_error
    puts argument_error.message
  end

  puts("- - - - - - -\n")
  puts "Subtraction Example (with Matching Bases):"
  begin
    puts dimensionalObject1 - dimensionalObject3
  rescue ArgumentError => argument_error
    puts argument_error.message
  end

  puts("- - - - - - -\n")
  #Multiplication Example
  puts "Multiplication Example:"
  puts dimensionalObject1 * dimensionalObject2

  puts("- - - - - - -\n")

  #Division Example
  puts "Division Example:"
  puts dimensionalObject2 / dimensionalObject1
end