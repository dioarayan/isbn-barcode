class CalculateDigitsException < StandardError
  def calculate_error_message
    "Failed to calculate check digit."
  end

  def formatting_error_message
    "Please input a valid ISBN"
  end
end
