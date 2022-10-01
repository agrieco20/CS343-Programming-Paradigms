=begin #comment
Name: Anthony Grieco
Date: 9/29/2022

Description: This super-class defines what the legal "dimensions" are (Time ["s"], Distance ["m"], and/or Mass ["kg"]) and ensures that only the quantities of the appropriate dimensions can interact with one another (dependent on the specific condition). For example, quantities related to speed (measured as "s") can be added to other given quantities related to speed
=end #comment

class Dimensions

  #Constructor, Designed to be treated as if it were an array that can accept as many values as the user wants to be calculated at a time
  def initialize(*arrayOfItems)
    @arrayOfItems = arrayOfItems
  end

  #TEMPORARY FUNCTION
  def printTest
    return @arrayOfItems[0]
  end
  #Needs an internal function to split each quantity from their respective unit [keeps unit in a new array of data]
  #Needs function to check if the units ("s", "m", or "kg") at the end of the dimensioned quantity to see whether it and another given dimensioned quantity can be used in the same mathematical equation
  #Needs a "to_s function"
end