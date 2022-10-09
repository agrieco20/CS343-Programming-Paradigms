=begin #comment
Name: Anthony Grieco
Date: 9/29/2022

Description: This super-class defines what the legal "dimensions" are (Time ["s"], Distance ["m"], and/or Mass ["kg"]) and ensures that only the quantities of the appropriate dimensions can interact with one another (dependent on the specific condition). For example, quantities related to speed (measured as "s") can be added to other given quantities related to speed
=end #comment

class Dimensions
  private attr_accessor :dimensionTimeExp1, :dimensionDistanceExp1, :dimensionMassExp1

  #Constructor, Parameter designed to be treated as if it were an array that can accept as many values as the user wants to be calculated at a time
  def initialize(dimensionTimeExp, dimensionDistanceExp, dimensionMassExp)
    @dimensionTimeExp1 = dimensionTimeExp #Accepts Time Dimension
    @dimensionDistanceExp1 = dimensionDistanceExp #Accepts Distance Dimension
    @dimensionMassExp1 = dimensionMassExp #Accepts Mass Dimension

    # puts @dimensionTimeExp1
    # puts @dimensionDistanceExp1
    # puts @dimensionMassExp1

    #Variables Positive if found on top of equation, negative if found on bottom of equation, and 0 if not found at all in equation
  end

  #Time (s) Exp Variable
  def dimensionTimeExp_Getter1
    # puts @dimensionTimeExp1 #TEMPORARY

    return @dimensionTimeExp1
  end

  #Distance (m) Exp Variable
  def dimensionDistanceExp_Getter1
    # puts @dimensionDistanceExp1 #TEMPORARY

    return @dimensionDistanceExp1
  end

  #Mass (kg) Exp Variable
  def dimensionMassExp_Getter1
    # puts @dimensionMassExp1 #TEMPORARY

    return @dimensionMassExp1
  end

  #Need overloads for all of the math operators for the above variables

  #NOTE: Values ("dimensioned_quantities") are correctly calculated (but needs to return value as float though to eliminate the problem of integer division)

  #Addition
  def +(dimension)
    #Check to see if bases are the exact same, if same -> return bases of original object, if different -> throw ArgumentExceptionError and state that the given operation cannot be completed because the bases do not match

    # dimensionTimeExp =
    # if @dimensionTimeExp != dimension.dimensionTimeExp
    # print "failure" #Test

    # end
  end

  #Subtraction
  def -(dimension)
    #Check to see if bases are the exact same, if same -> return bases of original object, if different -> throw ArgumentExceptionError and state that the given operation cannot be completed because the bases do not match
  end

  #Multiplication (^ = *)
  def *(dimension)
    #Adds like bases together
    # puts dimensionTimeExp_Getter1 #TEMPORARY
    # puts dimensionDistanceExp_Getter1 #TEMPORARY
    # puts dimensionMassExp_Getter1 #TEMPORARY
    # puts @dimensionTimeExp1 #TEMPORARY
    # puts @dimensionDistanceExp1 #TEMPORARY
    # puts @dimensionMassExp1 #TEMPORARY

    # nums = Array.new(3)
    # nums[0] = @dimensionTimeExp + dimension.dimensionTimeExp_Getter
    # nums[1] = @dimensionDistanceExp + dimension.dimensionDistanceExp_Getter
    # nums[2] = @dimensionMassExp + dimension.dimensionMassExp_Getter
    # return nums
    # puts 5+3 #Works

    # puts "dimensionTimeExp_Getter1: %s" % dimensionTimeExp_Getter1 #TEMPORARY
    # puts "dimension.dimensionTimeExp_Getter1: %s" % dimension.dimensionTimeExp_Getter1 #TEMPORARY

    # newTimeExp = self.dimensionTimeExp + dimension.dimensionTimeExp_Getter
    # newTimeExp = @dimensionTimeExp1 + dimension.dimensionTimeExp_Getter1 #Fails
    newTimeExp = dimensionTimeExp_Getter1 + dimension.dimensionTimeExp_Getter1
    # puts newTimeExp #TEMPORARY

    # puts "dimensionDistanceExp_Getter1: %s" % dimensionDistanceExp_Getter1 #TEMPORARY
    # puts "dimension.dimensionTimeExp_Getter1: %s" % dimension.dimensionDistanceExp_Getter1 #TEMPORARY
    newDistanceExp = dimensionDistanceExp_Getter1 + dimension.dimensionDistanceExp_Getter1
    # puts newDistanceExp #TEMPORARY

    # puts "dimensionMassExp_Getter1: %s" % dimensionMassExp_Getter1 #TEMPORARY
    # puts "dimension.dimensionMassExp_Getter1: %s" % dimension.dimensionMassExp_Getter1 #TEMPORARY
    newMassExp = dimensionMassExp_Getter1 + dimension.dimensionMassExp_Getter1
    # puts newMassExp #TEMPORARY

    # return @dimensionTimeExp += dimension.dimensionTimeExp_Getter, @dimensionDistanceExp += dimension.dimensionDistanceExp_Getter, @dimensionMassExp += dimension.dimensionMassExp_Getter
    return Dimensions.new(newTimeExp, newDistanceExp, newMassExp)
  end

  #Division
  def /(dimension)
    #Subtracts like bases from each other

    #NEED TO COPY THE "*" FUNCTION AND MAKE MINOR MODIFICATIONS SO THAT DIVISION WILL BE COMPLETED INSTEAD OF MULTIPLICATION


    newTimeExp = @dimensionTimeExp1 - dimension.dimensionTimeExp_Getter1
    newDistanceExp = @dimensionDistanceExp1 - dimension.dimensionDistanceExp_Getter1
    newMassExp = @dimensionMassExp1 - dimension.dimensionMassExp_Getter1

    return Dimensions.new(newTimeExp, newDistanceExp, newMassExp)
  end

  def to_s
    return "Dimension Exponents: s = %d, m = %d, kg = %d" % [@dimensionTimeExp1, @dimensionDistanceExp1, @dimensionMassExp1]
  end
end