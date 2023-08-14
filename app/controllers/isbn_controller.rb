class IsbnController < ApplicationController

  def index     
  end 

  def calculate_isbn
    check_digit = Calculate::CalculateDigits.call(isbn_input: get_input)
    @final_result = get_input + check_digit.to_s
    puts @final_result
    respond_to do |format|
      format.js { render 'isbn/final_result'}
    end
      rescue CalculateDigitsException => e
      redirect_to root_path, alert: e.formatting_error_message
  end

  private

  def get_input 
    return params[:isbn_input]
  end

end
