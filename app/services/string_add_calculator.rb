class StringAddCalculator
    attr_reader :input
  
    def initialize(numbers:)
      @input = numbers.to_s.strip
    end
  
    def execute
        delimiter, number_string = extract_delimiter_and_numbers(input)
        sum = number_string.split(delimiter).map(&:to_i).sum
        { errors: nil, result: sum }
    end
  
    private
  
    def extract_delimiter_and_numbers(string)
  
      if string.start_with?("//")
        custom_delimiter = Regexp.escape(string[2])
        number_body = string[4..] # skip `//<delimiter>\n`
        delimiter = /#{custom_delimiter}/
      else
        delimiter = /,|\n/
        number_body = string
      end
  
      [delimiter, number_body]
    end
  end
  