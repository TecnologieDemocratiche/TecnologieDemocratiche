require 'date'

# This class stores the procedures needed to handle the format of italian codice fiscale
class CodiceFiscale

  # Regex for validation. It validates the code without the check-digit.
  # It also separates the sections with appropriate grouping. Example:
  # codice_fiscale =~ FORMAT_NO_CHECK_DIGIT
  # name, year, month, day, place = $1, $2, $3, $4, $5
  # Duplication avoidance is handled
  FORMAT_NO_CHECK_DIGIT = /([A-Z]{6})([\dL-V]{2})([ABCDEHLMPRST])([\dL-V]{2})([A-Z][\dL-V]{3})/

  # Regex for validation. It validates the code with the check-digit
  # It also separates the sections with appropriate grouping. Example:
  # codice_fiscale =~ FORMAT_NO_CHECK_DIGIT
  # name, year, month, day, place, check_digit = $1, $2, $3, $4, $5, $6
  # Duplication avoidance is handled
  FORMAT = /#{FORMAT_NO_CHECK_DIGIT}([A-Z])/

  # Check digit translation table for odd positions
  ODD = YAML.load(File.read("app/services/odd_map.yml"))

  # Check digit translation table for even positions
  EVEN = YAML.load(File.read("app/services/even_map.yml"))

  # Translation for the month field
  MONTHS = YAML.load(File.read("app/services/months_map.yml"))

  # Validates a codice fiscale. It checks for format and check-digit correctness
  def self.valid?(str)
    return false unless str
    str.upcase!
    return false unless str =~ FORMAT
    return false unless str[-1, 1] == self.check_digit(str[0..14], true)
    true
  end

  # Calulates check digit. It raises +ArgumentError+ if the format is not valid.
  def self.check_digit(str, format_ok=false)
    unless format_ok
      self.upcase_match(str, FORMAT_NO_CHECK_DIGIT)
    end

    sum = 0
    (0..14).each do |i|
      if (i+1).even?
        sum += EVEN[str[i].chr]
      else
        sum += ODD[str[i].chr]
      end
    end
    ((sum % 26) + "A".ord).chr
  end


  def self.upcase_match(str, fmt)
    raise ArgumentError.new("nil input") unless str
    str.upcase!
    raise ArgumentError.new("Input doesn't match with codice fiscale format") unless str =~ fmt
    $~
  end
end
