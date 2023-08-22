class IsbnController < ApplicationController

  def index    
    respond_to do |format|
      format.html 
      format.turbo_stream
    end
  end 

  def calculate_isbn
    @final_result = Calculate::CalculateDigits.call(isbn_input: get_input)
    respond_to do |format|
      if @final_result 
        format.html { render :index }
        format.turbo_stream
      else
        format.html { render :index, status: :unprocessable_entity }
      end
    end
      rescue CalculateDigitsException => e
      redirect_to root_path, alert: e.formatting_error_message
  end

  private

  def get_input 
    return params[:isbn_input]
  end

end

