class IsbnController < ApplicationController

  def index     
  end 

  def calculate_isbn
    @final_result = Calculate::CalculateDigits.call(isbn_input: get_input)
    respond_to do |format|
        format.turbo_stream{ render turbo_stream: turbo_stream.update("isbn_result", 
          partial: 'isbn/final_result', locals: {final_result: @final_result})}
        format.html { render :index, alert: "Successfully calculated ISBN!" }
    end
      rescue CalculateDigitsException => e
      redirect_to root_path, alert: e.formatting_error_message
  end

  private

  def get_input 
    return params[:isbn_input]
  end

end
