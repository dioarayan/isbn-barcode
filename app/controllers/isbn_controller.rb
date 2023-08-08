class IsbnController < ApplicationController

  def index     
    
  end 

  def result

  end

  def solve
    check_digit = Calculate::CalculateDigits.call(isbn_input: get_input)
    respond_to do |format|
      format.html {render :result, locals: { check_digit: check_digit, final_result: get_input + check_digit.to_s }}
    end
      rescue CalculateDigitsException => e
      redirect_to request.path, error: e.calculate_error_message
  end

  private

  def get_input 
    return params[:isbn_input]
  end

  def complete_ISBN
    return check_digit
  end

end
