class IsbnController < ApplicationController

  def index     
    @result = false
  end 

  def calculate
    puts get_input
    check_digit = Calculate::CalculateDigits.call(isbn_input: get_input)
    @result = true
    respond_to do |format|
      format.html { render :index, locals: { final_result: get_input + check_digit } }
    end
      rescue CalculateDigitsException => e
      redirect_to root_path, alert: e.formatting_error_message
  end

  private

  def get_input 
    return params[:input]
  end

  def complete_ISBN
    return check_digit.to_s
  end

end
