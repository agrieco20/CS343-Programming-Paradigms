=begin #comment
Name: Anthony Grieco
Date: 9/29/2022

Description: This sub-class performs the necessary calculations to complete the requested operation (as described by the user)
=end #comment

require_relative 'Dimensions'

class Dimensioned_Quantities < Dimensions

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
  def + quantity
    if !quantity.kind_of? Dimensioned_Quantities #Need to replace this line with a conditional check to see whether the two items trying to be added together have the same ending unit (if not, raise the argument exception already listed below)
      raise ArgumentError.new("Only values containing the same unit can be added together.")
    end
    #Need to add the float/integer values here
    #Need to add the units together here (not really necessary for addition/subtraction operator overloads, but very much needed for multiplication/division overloads)
  end

  # def - other
  #
  # end

  # def * other
  #
  # end

  # def / other
  #
  # end

end
