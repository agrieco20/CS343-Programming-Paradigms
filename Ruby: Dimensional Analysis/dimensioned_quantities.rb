=begin #comment
Name: Anthony Grieco
Date: 9/29/2022

Description: This sub-class performs the necessary calculations to complete the requested operation (as described by the user)
=end #comment

require_relative 'Dimensions'

class Dimensioned_Quantities
  private attr_accessor :dimensionedQuantity, :newQuantityDimension, :dimensionTimeExp, :dimensionDistanceExp, :dimensionMassExp

  # def initialize(dimensionedQuantity, dimensionTime, dimensionDistance, dimensionMass)
  #   @dimensionedQuantity = dimensionedQuantity #Accepts Value
  #   @dimensionTime = dimensionTime #Accepts Time Dimension
  #   @dimensionDistance = dimensionDistance #Accepts Distance Dimension
  #   @dimensionMass = dimensionMass #Accepts Mass Dimension
  #
  # end

  def initialize(dimensionedQuantity, dimensionTimeExp, dimensionDistanceExp, dimensionMassExp)
    @dimensionedQuantity = dimensionedQuantity #Accepts Value for the given dimension
    @newQuantityDimension = Dimensions.new(dimensionTimeExp, dimensionDistanceExp, dimensionMassExp)
  end

  def dimensionedQuantity_Getter
    return @dimensionedQuantity
  end

  #Doesn't need repeat the same classes as Dimensions (the "to_s" function being the only exception)
  # def initialize(*arrayOfItems)#Should probably treat it as though I will pass in an array of dimensioned quantities
  #   super arrayOfItems
  # end

  # def printTest(test){
  #
  # }
  # end

  #Needs a "to_s function"

  #Overloading the '+', '-', '*', and '/' operators so that they can accept a dimensional quantity with their units assigned
  # def + quantity
  #   # if !quantity.kind_of? Dimensioned_Quantities #Need to replace this line with a conditional check to see whether the two items trying to be added together have the same ending unit (if not, raise the argument exception already listed below)
  #   #   raise ArgumentError.new("Only values containing the same unit can be added together.")
  #   # end
  #   # #Need to add the float/integer values here
  #   # #Need to add the units together here (not really necessary for addition/subtraction operator overloads, but very much needed for multiplication/division overloads)
  # end


  #The following are overloaded math operators so the program is able perform dimensional analysis with the given value (the identifying units are covered in "dimension.rb")

  #Addition
  def +(quantity)
    # return @dimensionedQuantity
    variable = @dimensionedQuantity + quantity.dimensionedQuantity_Getter
    return variable

    # @newQuantityDimension += quantity.newQuantityDimension
    # return @dimensionedQuantity + quantity.dimensionedQuantity, " test2"
  end

  #Subtraction
  def -(quantity)
    return @dimensionedQuantity - quantity.dimensionedQuantity
  end

  #Multiplication
  def *(quantity)
    return @dimensionedQuantity * quantity.dimensionedQuantity
    # @newQuantityDimension *= quantity.newQuantityDimension
  end

  #Division
  def /(quantity)
    return @dimensionedQuantity / quantity.dimensionedQuantity
  end

  #Needs a "to_s function"
  def to_s
    # puts "%.2f" % dimensionedQuantity
    # return "%d" % @dimensionedQuantity, "%d" % @dimensionTimeExp
    # return "%.2f s% m% kg%" % dimensionedQuantity, dimensionTimeExp#, dimensionDistanceExp, dimensionMassExp

    # return "Dimensioned Quantity: %d\nDimensions: s= %s, m= %s, kg= %s" % [dimensionedQuantity, dimensionTimeExp, dimensionDistanceExp, dimensionMassExp]
    return "Dimensioned Quantity: %d\n%s" % [dimensionedQuantity, newQuantityDimension]
  end

end