class Calculate::CalculateDigits
  include Serviceable

  def initialize(isbn_input:)
    @isbn_input = isbn_input
  end

  def call
    handle_calculate
  end

  private

  attr_reader :isbn_input

  def handle_calculate
    return check_digit

    raise CalculateDigitsException
  end

  def subtract_by_ten(num)
    diff = 10 - num
    if diff == 10
      return 0
    else
      return diff.to_s
    end
  end
  
  def mod_by_ten(num)
    subtract_by_ten(num % 10)
  end
    
  def add_digits(array)
    sum = 0
    array.each do |i|
      sum += i
    end
    mod_by_ten(sum)
  end
  
  def calculate_each_digit(array)
    result= []
    array.each_with_index do |digit, index|
      if index == 0  
        digit *= 1
        result << digit
      elsif index % 2 != 0
        digit *= 3
        result << digit
      else 
        digit *= 1
        result << digit
      end
    end
    @calculate_each_digit = result
    add_digits(@calculate_each_digit)
  end
  
  def convert_to_array_digit(input)
    @convert_to_array_digit ||= (input.chars).map { |string| string.to_i }
    calculate_each_digit(@convert_to_array_digit)
  end

  def check_digit
    @check_digit  = convert_to_array_digit(isbn_input)
  end
  
end
