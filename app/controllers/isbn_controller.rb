class IsbnController < ApplicationController
  before_action :get_input
  # before_action :to_chars

  def index     

  end 

  def solve
    char_converted = convert_to_array_digit(@input)
    found_digits = calculate_each_digit(char_converted)
    sum_digits = add_digits(found_digits)
    mod_result = mod_by_ten(sum_digits)
    final_result = subtract_by_ten(mod_result)
    final_ISBN = concat_final_result(@input, final_result)
    respond_to do |format|
      if !@input.blank?
        format.html {render :result, locals: { result: final_ISBN }}
      else
        format.html {render :index, data: {turbo: true }, alert: 'Please enter numbers to calculate!' }  
      end
    end
  end

  private

  def get_input 
    @input = params[:isbn_input]
  end

  def convert_to_array_digit(input)
    (input.chars).map { |string| string.to_i }
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
    return result
  end

  def add_digits(array)
    sum = 0
    array.each do |i|
      sum += i
    end
    return sum
  end

  def mod_by_ten(num)
    return num % 10
  end

  def subtract_by_ten(num)
    diff = 10 - num
    if diff == 10
      return 0
    else
      return diff
    end
  end

  def concat_final_result(input, num)
    string_num = num.to_s
    return input + string_num
  end

end
