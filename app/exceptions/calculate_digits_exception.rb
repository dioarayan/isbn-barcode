class DocumentForwardingException < StandardError
  def calculate_error_message
    "Failed to calculate check digit."
  end
end
