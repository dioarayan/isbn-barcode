class IsbnController < ApplicationController\

  def index     

  end 

  def solve
    final_ISBN = Calculate::CalculateDigits.call(isbn_input: get_input)
    respond_to do |format|
      format.html {render :result, locals: { result: final_ISBN }}
    end
      rescue DocumentForwardingException => e
      redirect_to request.path, error: e.calculate_error_message
  end

  private

  def get_input 
    @input = params[:isbn_input]
  end

end
