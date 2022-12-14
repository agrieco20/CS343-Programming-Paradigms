=begin #comment
Name: Anthony Grieco
Class: CS343 Programming Paradigms
Language: Ruby
Date: 9/28/2022

Description: This program takes decimal numbers (in this case 0-255 for demonstration purposes) and converts them into Binary Array Format. For example, "5" is returned as [0,0,0,0,0,1,0,1]
=end #comment

#This function returns the Binary representation of a decimal number in an array format
def binaryArrayFormatter
  currentNum = yield

  arrayLengthDeterminer = currentNum #Stored in arrayLengthDeterminer
  arrayLengthCounter = 0 #Ensures that the number entered is at least 8 digits in Binary. If not, extra leading zeroes are added. If number in Binary requires more than 8 digits of binary, an extra slot in the Binary Array is allocated for the given decimal number

  while arrayLengthDeterminer > 0
    arrayLengthDeterminer /= 2
      arrayLengthCounter += 1
  end

  #Checks to see if the Decimal conversion into Binary would have under 8 digits (if so, space for leading zeros is allocated)
  if arrayLengthCounter < 8
    arrayLengthCounter = 8
  end

  binaryArray = Array.new(arrayLengthCounter)
  binaryArrayLengthCounter = binaryArray.length - 1

  #Calculates what the Binary Value of a number should be, assigns the value in reverse order to "binaryArray" and then returns it in the following line back to the main program
  while binaryArrayLengthCounter >= 0
    binaryArray[binaryArrayLengthCounter] = currentNum % 2
    currentNum /= 2
    binaryArrayLengthCounter -= 1
  end
  binaryArray #Because this is the last line of the binaryArrayFormatter function, the "return" here is implied by Ruby
end

if __FILE__ == $0
  digits = Array(0...256) #Assigns the values 0-255 to be sent through the "binaryArrayFormater" function to ensure that it is working

  digits.each_index do|index| #For Loop
    print digits[index] , ": " , binaryArrayFormatter{digits[index]}, "\n"#Calls the "binaryArrayFormatter" function and converts the current index of the array into a Binary Array, the given "parameter" is set equal currentNum through the use of the "yield" command
  end
end