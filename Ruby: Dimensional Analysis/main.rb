=begin #comment
Name: Anthony Grieco
Class: CS343 Programming Paradigms
Language: Ruby
Date: 9/29/2022

Description: This program performs Dimensional Analysis calculations on data related to Time (s), Distance (m), and/or Mass (kg)
=end #comment

require_relative 'dimensioned_quantities'
require_relative 'dimensions'

#main
if __FILE__ == $0
  #TEMPORARY
  # -----
  temp1 = Dimensions.new("10 s","20 m","30 kg")
  temp1.printTest

  temp2 = Dimensioned_Quantities.new("11 s","22 m","33 kg")
  temp2.printTest

  test1_var = temp1.printTest
  test2_var = temp2.printTest

  mathTest = test1_var + test2_var #Only concatenates the two strings as it is, need to overload the "+" operator so that it will add the two instead
  print mathTest

  # -----

end