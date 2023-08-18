class Calculate::CalculateDigits
  include Serviceable

  def initialize(isbn_input:)
    @isbn_input = isbn_input
  end

  def call
    calculate_isbn
  end

  private

  attr_reader :isbn_input

  def calculate_isbn
    return final_isbn

    raise CalculateDigitsException
  end    
  
  def final_isbn
    @final_isbn  = convert_to_array_digit(isbn_input)
  end
  
  def convert_to_array_digit(input)
    @convert_to_array_digit = (input.chars).map { |string| string.to_i }
    calculate_each_digit(@convert_to_array_digit)
  end
  
  def calculate_each_digit(array)
    result= []
    array.each_with_index do |digit, index|
      if index.zero? || index.even?
        digit *= 1
        result << digit
      elsif index.odd?
        digit *= 3
        result << digit
      end
    end
    add_digits(result)
  end

  def add_digits(array)
    sum = 0
    array.each do |i|
      sum += i
    end
    mod_by_ten(sum)
  end  

  def mod_by_ten(num)
    subtract_by_ten(num % 10)
  end

  def subtract_by_ten(num)
    diff = 10 - num
    if diff == 10
      complete_ISBN(0)
    else
      complete_ISBN(diff)
    end
  end

  def complete_ISBN(num)
    @complete_ISBN = isbn_input + num.to_s
  end

end