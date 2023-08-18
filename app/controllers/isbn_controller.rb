class IsbnController < ApplicationController
  before_action :check_for_cancel

  def index    
    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end 

  def calculate_isbn
    @final_result = Calculate::CalculateDigits.call(isbn_input: get_input)
    respond_to do |format|
      format.turbo_stream
      format.html { render :index, alert: "Successfully calculated ISBN!" }
    end
      rescue CalculateDigitsException => e
      redirect_to root_path, alert: e.formatting_error_message
  end

  def check_for_cancel
    if params[:commit] == "Cancel"
      redirect_to root_path
    end
  end
  

  private

  def get_input 
    return params[:isbn_input]
  end

end
