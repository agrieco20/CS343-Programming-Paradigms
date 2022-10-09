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
  test1 = Dimensioned_Quantities.new(4, 0, 1, 2)

  test2 = Dimensioned_Quantities.new(1, -1, 1, 1)


  # puts test1 #Works!
  # puts test2



  #Multiplication Example
  # puts "\nMultiplication Example:"


  # test3 = Dimensioned_Quantities.new(test1.dimensionedQuantity_Getter * test2.dimensionedQuantity_Getter, test1.newQuantityDimension.dimensionTimeExp_Getter1 * test2.newQuantityDimension.dimensionTimeExp_Getter1, test1.newQuantityDimension.dimensionDistanceExp_Getter1 * test2.newQuantityDimension.dimensionDistanceExp_Getter1, test1.newQuantityDimension.dimensionMassExp_Getter1 * test2.newQuantityDimension.dimensionMassExp_Getter1)
  # puts test3

  #Division Example

  print("\n") #Temporaru

  puts test1
  puts test2

  #Multiplication Example
  puts "\nMultiplication Example:"
  puts test1 * test2

  puts("- - - - - - -")
  # test5 = Dimensions.new(1, 2, 3)
  # puts test5
  # test6 = Dimensions.new(4, 5, 6)
  # puts test6
  # puts test7 = test5 * test6
  # puts test7


  puts("- - - - - - -")

  # puts test5
  # puts test7
  # puts test8 = test5/test7
  # puts test8

  puts("- - - - - - -")

  # test9 = test1 / test2
  # puts test9

  # puts test1 * test2
  puts("- - - - - - -")
  #
  # te1st = Dimensions.new(4,4, 4)
  # te2st = Dimensions.new(3,3,3)
  # puts te1st
  # puts te2st

  #Test
  #-----
  # puts test1.dimensionedQuantity_Getter
  #
  # puts test1.newQuantityDimension.dimensionTimeExp_Getter
  # puts test1.newQuantityDimension.dimensionDistanceExp_Getter
  # puts test1.newQuantityDimension.dimensionMassExp_Getter
  #-----

  # puts test1.dimensionTimeExp_Getter
  # puts test1.dimensionDistanceExp_Getter
  # puts test1.dimensionMassExp_Getter

  # #TEMPORARY
  # # -----
  # temp1 = Dimensions.new("10 s","20 m","30 kg")
  # temp1.printTest
  # print temp1.unitsChecker("10 s","20 m","30 kg") #TEMPORARY TEST
  #
  # temp2 = Dimensioned_Quantities.new("11 s","22 m","33 kg")
  # temp2.printTest
  #
  # test1_var = temp1.printTest
  #
  # test2_var = temp2.printTest
  #
  # mathTest = test1_var + test2_var #Only concatenates the two strings as it is, need to overload the "+" operator so that it will add the two instead
  # print mathTest
  #
  # # -----

end