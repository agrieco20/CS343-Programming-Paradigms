=begin #comment
Name: Anthony Grieco
Date: 9/29/2022

Description: This sub-class performs the necessary calculations to complete the requested operation (as described by the user)
=end #comment

require_relative 'Dimensions'

class Dimensioned_Quantities
  private attr_accessor :dimensionedQuantity,  :dimensionTimeExp, :dimensionDistanceExp, :dimensionMassExp
  attr_accessor :newQuantityDimension #Allows for the creation of a "Dimensions" class within the "Dimensioned_quantities" class; Not "private" so that the private variables/methods of the new "Dimensions" object can now be accessed
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

  #Time (s) Exp Variable
  def dimensionTimeExp_Getter
    return @dimensionTimeExp
  end

  #Distance (m) Exp Variable
  def dimensionDistanceExp_Getter
    return @dimensionDistanceExp
  end

  #Mass (kg) Exp Variable
  def dimensionMassExp_Getter
    return @dimensionMassExp
  end

  # #Time (s) Exp Variable
  # def dimensionTimeExp_Getter
  #   return dimensionTimeExp
  # end
  #
  # #Distance (m) Exp Variable
  # def dimensionDistanceExp_Getter
  #   return dimensionDistanceExp
  # end
  #
  # #Mass (kg) Exp Variable
  # def dimensionMassExp_Getter
  #   return dimensionMassExp
  # end

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
  # def +(quantity)
  #   # return @dimensionedQuantity
  #   return @dimensionedQuantity + quantity.dimensionedQuantity_Getter
  #   # return variable
  #
  #   # @newQuantityDimension += quantity.newQuantityDimension
  #   # return @dimensionedQuantity + quantity.dimensionedQuantity, " test2"
  # end
  def +(quantity)
    # if quantity == Dimensioned_Quantities
    #   return @dimensionedQuantity + quantity.dimensionedQuantity_Getter
    #
    # else
    #   super(quantity)
    #
    # end


    return @dimensionedQuantity + quantity.dimensionedQuantity_Getter #Original

    # return variable

    # @newQuantityDimension += quantity.newQuantityDimension
    # return @dimensionedQuantity + quantity.dimensionedQuantity, " test2"
  end

  #Subtraction
  def -(quantity)
    return @dimensionedQuantity - quantity.dimensionedQuantity_Getter
  end

  #Multiplication
  def *(quantity)
    # @newQuantityDimension = Dimensions.new(@dimensionTimeExp, @dimensionDistanceExp, @dimensionMassExp)
    # quantity

    # return @newQuantityDimension.dimensionTimeExp_Getter * quantity.newQuantityDimension.dimensionTimeExp_Getter

    # calculatedQuantity = @dimensionedQuantity * quantity.dimensionedQuantity_Getter
    # calculatedTimeExp = @dimensionTimeExp * quantity.dimensionTimeExp_Getter
    # calculatedDistanceExp
    # calculatedMassExp
    # @newQuantityDimension *= quantity.newQuantityDimension

    # puts "test", quantity.dimensionedQuantity_Getter #TEMPORARY
    # puts "test", quantity.newQuantityDimension.dimensionTimeExp_Getter1 #TEMPORARY

    firstDimensions = Dimensions.new(newQuantityDimension.dimensionTimeExp_Getter1, newQuantityDimension.dimensionDistanceExp_Getter1, newQuantityDimension.dimensionMassExp_Getter1)
    secondDimensions = Dimensions.new(quantity.newQuantityDimension.dimensionTimeExp_Getter1, quantity.newQuantityDimension.dimensionDistanceExp_Getter1, quantity.newQuantityDimension.dimensionMassExp_Getter1)

    # puts firstDimensions #TEMPORARY
    # puts secondDimensions #TEMPORARY

    dimensionsAnalysis = firstDimensions * secondDimensions

    #Creates a new Dimensioned_Quantities object as the final result of Dimensional Analysis
    return Dimensioned_Quantities.new(@dimensionedQuantity * quantity.dimensionedQuantity_Getter, dimensionsAnalysis.dimensionTimeExp_Getter1, dimensionsAnalysis.dimensionDistanceExp_Getter1, dimensionsAnalysis.dimensionMassExp_Getter1)
  end

  #Division
  def /(quantity)
    #NEED TO COPY THE "*" FUNCTION AND MAKE MINOR MODIFICATIONS SO THAT DIVISION WILL BE COMPLETED INSTEAD OF MULTIPLICATION (SAME WITH THE "/" EQUIVALENT IN THE "Dimensions" CLASS)

    return @dimensionedQuantity / quantity.dimensionedQuantity_Getter
  end

  #Allows any "Dimensional_Quantities" objects to print out all of their information to the console when called (new objects created as a result of Dimensional Analysis print out their information immediately by default)
  def to_s
    # puts "%.2f" % dimensionedQuantity
    # return "%d" % @dimensionedQuantity, "%d" % @dimensionTimeExp
    # return "%.2f s% m% kg%" % dimensionedQuantity, dimensionTimeExp#, dimensionDistanceExp, dimensionMassExp

    # return "Dimensioned Quantity: %d\nDimensions: s= %s, m= %s, kg= %s" % [dimensionedQuantity, dimensionTimeExp, dimensionDistanceExp, dimensionMassExp]
    return "Dimensioned Quantity: %d\n%s" % [dimensionedQuantity, newQuantityDimension]
  end

end