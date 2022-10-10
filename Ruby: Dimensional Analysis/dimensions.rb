=begin #comment
Name: Anthony Grieco
Date: 10/9/2022

Description: This class defines what the legal "dimensions" are (Time ["s"], Distance ["m"], and/or Mass ["kg"]), performs the dimensional component in dimensional analysis (increments/decrements the exponent bases appropriately based on the operation the user wants to completed), and ensures that only the quantities of objects with the appropriate dimensions can interact with one another.
  For example, quantities with only a base in speed (represented as "s = 1, m = 0, kg = 0") can be added/subtracted to/from other given quantities related to (and only) speed (can only be added/subtracted from other quantities with their bases represented as "s = 1, m = 0, kg = 0").
  Any two "Dimensional_Quantity" objects can be multiplied/divided together without any issues or stipulations.
=end #comment

class Dimensions
  private attr_accessor :dimensionTimeExp, :dimensionDistanceExp, :dimensionMassExp

  #The Exponent Bases are positive if they would be found in the numerator of an equation (top of equation), negative if found in the denominator of an equation (bottom of equation), and 0 if not found at all in the given equation
  def initialize(dimensionTimeExp, dimensionDistanceExp, dimensionMassExp)
    @dimensionTimeExp = dimensionTimeExp #Accepts Time Dimension
    @dimensionDistanceExp = dimensionDistanceExp #Accepts Distance Dimension
    @dimensionMassExp = dimensionMassExp #Accepts Mass Dimension
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

  #Addition
  def +(dimension)
    #Checks to see if the dimensions match, and if they do the calculation continues as normal (with nothing done to the bases). In the case where the bases do not match, an Argument Exception is thrown to alert the user that the calculation they wanted to be performed cannot be done because it would violate the rules of Dimensional Analysis
    if dimensionTimeExp_Getter == dimension.dimensionTimeExp_Getter && dimensionDistanceExp_Getter == dimension.dimensionDistanceExp_Getter && dimensionMassExp_Getter == dimension.dimensionMassExp_Getter
        newTimeExp = dimensionTimeExp_Getter
        newDistanceExp = dimensionDistanceExp_Getter
        newMassExp = dimensionMassExp_Getter

        #Creates (and returns) a new "Dimensions" object with the updated dimension bases for the new "Dimensioned_Quantity" object being constructed
        return Dimensions.new(newTimeExp, newDistanceExp, newMassExp)
    else
      #If the dimension bases of the two "Dimensions" objects do not match, an error is thrown alerting the user they attempted to perform an illegal calculation of Dimensional Analysis
      raise ArgumentError.new("You cannot add two dimensional quantities together that don't share the same bases.\n")
    end
  end

  #Subtraction
  def -(dimension)
    #Checks to see if the dimensions match, and if they do the calculation continues as normal (with nothing done to the bases). In the case where the bases do not match, an Argument Exception is thrown to alert the user that the calculation they wanted to be performed cannot be done because it would violate the rules of Dimensional Analysis
    if dimensionTimeExp_Getter == dimension.dimensionTimeExp_Getter && dimensionDistanceExp_Getter == dimension.dimensionDistanceExp_Getter && dimensionMassExp_Getter == dimension.dimensionMassExp_Getter
      newTimeExp = dimensionTimeExp_Getter
      newDistanceExp = dimensionDistanceExp_Getter
      newMassExp = dimensionMassExp_Getter

      #Creates (and returns) a new "Dimensions" object with the updated dimension bases for the new "Dimensioned_Quantity" object being constructed
      return Dimensions.new(newTimeExp, newDistanceExp, newMassExp)
    else
      #If the dimension bases of the two "Dimensions" objects do not match, an error is thrown alerting the user they attempted to perform an illegal calculation of Dimensional Analysis
      raise ArgumentError.new("You cannot add two dimensional quantities together that don't share the same bases.\n")
    end
  end

  #Multiplication (Adds like bases together)
  def *(dimension)
    #Assigns values for the new Dimensions object based off of the two Dimension_Quantities objects passed to the function
    newTimeExp = dimensionTimeExp_Getter + dimension.dimensionTimeExp_Getter
    newDistanceExp = dimensionDistanceExp_Getter + dimension.dimensionDistanceExp_Getter
    newMassExp = dimensionMassExp_Getter + dimension.dimensionMassExp_Getter

    #Creates (and returns) a new "Dimensions" object with the updated dimension bases for the new "Dimensioned_Quantity" object being constructed
    return Dimensions.new(newTimeExp, newDistanceExp, newMassExp)
  end

  #Division (Subtracts like bases from each other)
  def /(dimension)
    #Assigns values for the new Dimensions object based off of the two Dimension_Quantities objects passed to the function
    newTimeExp = dimensionTimeExp_Getter - dimension.dimensionTimeExp_Getter
    newDistanceExp = dimensionDistanceExp_Getter - dimension.dimensionDistanceExp_Getter
    newMassExp = dimensionMassExp_Getter - dimension.dimensionMassExp_Getter

    #Creates (and returns) a new "Dimensions" object with the updated dimension bases for the new "Dimensioned_Quantity" object being constructed
    return Dimensions.new(newTimeExp, newDistanceExp, newMassExp)
  end

  #When a "Dimensions" object is called, it automatically returns all the relevant information that it holds (exponents for its Time, Distance, and Mass bases) so that the user can see that the Dimensional Analysis that they wanted to be performed has been completed
  def to_s
    return "Dimension Exponents: s = %d, m = %d, kg = %d" % [@dimensionTimeExp, @dimensionDistanceExp, @dimensionMassExp]
  end
end