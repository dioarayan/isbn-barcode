class IsbnController < ApplicationController

  def index     
    
  end 

  def calculate
    check_digit = Calculate::CalculateDigits.call(isbn_input: get_input)
    respond_to do |format|
      format.html {render :result, locals: { check_digit: check_digit, final_result: get_input + check_digit }}
    end
      rescue CalculateDigitsException => e
      redirect_to root_path, alert: e.formatting_error_message
  end

  private

  def get_input 
    return params[:isbn_input]
  end

  def complete_ISBN
    return check_digit.to_s
  end

end
