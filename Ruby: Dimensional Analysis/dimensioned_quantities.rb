=begin #comment
Name: Anthony Grieco
Date: 10/9/2022

Description: This class performs the necessary calculations to complete the requested operations as described by the user and creates a new "Dimensional_Quantity" at the end of the calculation with the newly calculated quantity and accompanying bases (through "dimensions.rb")
=end #comment

require_relative 'Dimensions'

class Dimensioned_Quantities
  private attr_accessor :dimensionedQuantity,  :dimensionTimeExp, :dimensionDistanceExp, :dimensionMassExp
  attr_accessor :newQuantityDimension #Allows for the creation of a "Dimensions" class within the "Dimensioned_quantities" class; Not "private" so that the private variables/methods of the new "Dimensions" object can now be accessed

  def initialize(dimensionedQuantity, dimensionTimeExp, dimensionDistanceExp, dimensionMassExp)
    @dimensionedQuantity = dimensionedQuantity #Accepts Value for the given dimension
    @newQuantityDimension = Dimensions.new(dimensionTimeExp, dimensionDistanceExp, dimensionMassExp)
  end

  def dimensionedQuantity_Getter
    return @dimensionedQuantity
  end

  #The following are overloaded math operators so the program is able perform dimensional analysis with the given value (the identifying units are covered in "dimension.rb")

  #Addition
  def +(quantity)
    #Attains the dimensions of both "Dimensioned_Quantities" and converts them into their own "Dimensions" object so that analysis/calculation of the bases can occur
    firstDimensions = Dimensions.new(newQuantityDimension.dimensionTimeExp_Getter, newQuantityDimension.dimensionDistanceExp_Getter, newQuantityDimension.dimensionMassExp_Getter)
    secondDimensions = Dimensions.new(quantity.newQuantityDimension.dimensionTimeExp_Getter, quantity.newQuantityDimension.dimensionDistanceExp_Getter, quantity.newQuantityDimension.dimensionMassExp_Getter)

    dimensionsAnalysis = firstDimensions + secondDimensions

    #Creates a new Dimensioned_Quantities object as the final result of Dimensional Analysis
    return Dimensioned_Quantities.new(dimensionedQuantity_Getter + quantity.dimensionedQuantity_Getter, dimensionsAnalysis.dimensionTimeExp_Getter, dimensionsAnalysis.dimensionDistanceExp_Getter, dimensionsAnalysis.dimensionMassExp_Getter)
  end

  #Subtraction
  def -(quantity)
    #Attains the dimensions of both "Dimensioned_Quantities" and converts them into their own "Dimensions" object so that analysis/calculation of the bases can occur
    firstDimensions = Dimensions.new(newQuantityDimension.dimensionTimeExp_Getter, newQuantityDimension.dimensionDistanceExp_Getter, newQuantityDimension.dimensionMassExp_Getter)
    secondDimensions = Dimensions.new(quantity.newQuantityDimension.dimensionTimeExp_Getter, quantity.newQuantityDimension.dimensionDistanceExp_Getter, quantity.newQuantityDimension.dimensionMassExp_Getter)

    dimensionsAnalysis = firstDimensions - secondDimensions

    #Creates a new Dimensioned_Quantities object as the final result of Dimensional Analysis
    return Dimensioned_Quantities.new(dimensionedQuantity_Getter - quantity.dimensionedQuantity_Getter, dimensionsAnalysis.dimensionTimeExp_Getter, dimensionsAnalysis.dimensionDistanceExp_Getter, dimensionsAnalysis.dimensionMassExp_Getter)
  end

  #Multiplication
  def *(quantity)
    #Attains the dimensions of both "Dimensioned_Quantities" and converts them into their own "Dimensions" object so that analysis/calculation of the bases can occur
    firstDimensions = Dimensions.new(newQuantityDimension.dimensionTimeExp_Getter, newQuantityDimension.dimensionDistanceExp_Getter, newQuantityDimension.dimensionMassExp_Getter)
    secondDimensions = Dimensions.new(quantity.newQuantityDimension.dimensionTimeExp_Getter, quantity.newQuantityDimension.dimensionDistanceExp_Getter, quantity.newQuantityDimension.dimensionMassExp_Getter)

    dimensionsAnalysis = firstDimensions * secondDimensions

    #Creates a new Dimensioned_Quantities object as the final result of Dimensional Analysis
    return Dimensioned_Quantities.new(Float(@dimensionedQuantity) * Float(quantity.dimensionedQuantity_Getter), dimensionsAnalysis.dimensionTimeExp_Getter, dimensionsAnalysis.dimensionDistanceExp_Getter, dimensionsAnalysis.dimensionMassExp_Getter)
  end

  #Division
  def /(quantity)
    #Attains the dimensions of both "Dimensioned_Quantities" and converts them into their own "Dimensions" object so that analysis/calculation of the bases can occur
    firstDimensions = Dimensions.new(newQuantityDimension.dimensionTimeExp_Getter, newQuantityDimension.dimensionDistanceExp_Getter, newQuantityDimension.dimensionMassExp_Getter)
    secondDimensions = Dimensions.new(quantity.newQuantityDimension.dimensionTimeExp_Getter, quantity.newQuantityDimension.dimensionDistanceExp_Getter, quantity.newQuantityDimension.dimensionMassExp_Getter)

    dimensionsAnalysis = firstDimensions / secondDimensions

    #Creates a new Dimensioned_Quantities object as the final result of Dimensional Analysis
    return Dimensioned_Quantities.new(Float(@dimensionedQuantity) / Float(quantity.dimensionedQuantity_Getter), dimensionsAnalysis.dimensionTimeExp_Getter, dimensionsAnalysis.dimensionDistanceExp_Getter, dimensionsAnalysis.dimensionMassExp_Getter)
  end

  #When a "Dimensioned_Quantities" object is called, it allows any "Dimensional_Quantities" objects to print out all of their information to the console when called (new objects created as a result of Dimensional Analysis print out their information immediately by default)
  def to_s
    return "Dimensioned Quantity: %.2f\n%s" % [dimensionedQuantity, newQuantityDimension]
  end
end