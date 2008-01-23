class Expectations::XmlString < String
  
  def expectations_equal_to(other)
    self.strip.gsub(/>[\s]*</, "><") == other.strip.gsub(/>[\s]*</, "><")
  end
  
  def inspect
    "[as xml] #{self.strip.gsub(/>[\s]*</, "><")}"
  end
end