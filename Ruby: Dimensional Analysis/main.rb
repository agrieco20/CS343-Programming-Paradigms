=begin #comment
Name: Anthony Grieco
Class: CS343 Programming Paradigms
Language: Ruby
Date: 9/29/2022

Description: This program performs Dimensional Analysis calculations on data related to Time (s), Distance (m), and/or Mass (kg)
=end #comment

require_relative 'dimensioned_quantities'
# require_relative 'dimensions'

#main
if __FILE__ == $0
  test1 = Dimensioned_Quantities.new(1, 1, 2, 3)
  # print test.instance_variable_get(@dimensionedQuantity)
  test2 = Dimensioned_Quantities.new(2, 1, 2, 3)

  # tempTest = test1 + test2 #Works
  # print tempTest
  # test1.dimensionedQuantity = test1 * test2

  # puts test1.to_s
  puts test1 #Works!
  puts test2
  # puts test1.dimensionedQuantityGetter
  # test1.dimensionedQuantityGetter += 1
  # puts test1.dimensionedQuantityGetter

  #Multiplication Example
  puts "\nMultiplication Example:"
  test3 = Dimensioned_Quantities.new(test1 * test2, test1.newQuantityDimension.dimensionTimeExp_Getter * test2.newQuantityDimension.dimensionTimeExp_Getter, test1.newQuantityDimension.dimensionDistanceExp_Getter * test2.newQuantityDimension.dimensionDistanceExp_Getter, test1.newQuantityDimension.dimensionMassExp_Getter * test2.newQuantityDimension.dimensionMassExp_Getter)
  puts test3

  #Division Example
  puts "\nDivision Example:"
  test4 = Dimensioned_Quantities.new(test1 / test2, test1.newQuantityDimension.dimensionTimeExp_Getter / test2.newQuantityDimension.dimensionTimeExp_Getter, test1.newQuantityDimension.dimensionDistanceExp_Getter / test2.newQuantityDimension.dimensionDistanceExp_Getter, test1.newQuantityDimension.dimensionMassExp_Getter / test2.newQuantityDimension.dimensionMassExp_Getter)
  puts test4

  puts test1
  puts test2

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