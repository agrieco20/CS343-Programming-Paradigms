=begin #comment
Name: Anthony Grieco
Date: 9/29/2022

Description: This super-class defines what the legal "dimensions" are (Time ["s"], Distance ["m"], and/or Mass ["kg"]) and ensures that only the quantities of the appropriate dimensions can interact with one another (dependent on the specific condition). For example, quantities related to speed (measured as "s") can be added to other given quantities related to speed
=end #comment

class Dimensions
  attr_accessor :dimensionTimeExp, :dimensionDistanceExp, :dimensionMassExp

  #Constructor, Parameter designed to be treated as if it were an array that can accept as many values as the user wants to be calculated at a time
  def initialize(dimensionTimeExp, dimensionDistanceExp, dimensionMassExp)
    @dimensionTimeExp = dimensionTimeExp #Accepts Time Dimension
    @dimensionDistanceExp = dimensionDistanceExp #Accepts Distance Dimension
    @dimensionMassExp = dimensionMassExp #Accepts Mass Dimension

    #Variables Positive if found on top of equation, negative if found on bottom of equation, and 0 if not found at all in equation
  end

  #Time (s) Exp Variable
  #Distance (m) Exp Variable
  #Mass (kg) Exp Variable

  #Need overloads for all of the math operators for the above variables
  def +(dimension)
    #Check to see if bases are the exact same, if same -> return bases of original object, if different -> throw ArgumentExceptionError and state that the given operation cannot be completed because the bases do not match

    # dimensionTimeExp =
    # if @dimensionTimeExp != dimension.dimensionTimeExp
    # print "failure" #Test

    # end
  end

  def -(dimension)
    #Check to see if bases are the exact same, if same -> return bases of original object, if different -> throw ArgumentExceptionError and state that the given operation cannot be completed because the bases do not match
  end

  def *(dimension)
    #Adds like bases together
    # @dimensionTimeExp += dimension.dimensionTimeExp
    # @dimensionDistanceExp += dimension.dimensionDistanceExp
    # @dimensionMassExp += dimension.dimensionMassExp
  end

  def /(dimension)
    #Subtracts like bases from each other
    @dimensionTimeExp -= dimension.dimensionTimeExp
    @dimensionDistanceExp -= dimension.dimensionDistanceExp
    @dimensionMassExp -= dimension.dimensionMassExp
  end

  def to_s
    return "Dimensions: s = %d, m = %d, kg = %d" % [dimensionTimeExp, dimensionDistanceExp, dimensionMassExp]
  end
end