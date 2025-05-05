class StringAddCalculator
    attr_reader :input
  
    def initialize(numbers:)
      @input = numbers.to_s.strip
    end
  
    def execute
        
        negatives, delimiter, number_string = extract_delimiter_and_numbers(input)
        if negatives.any?
          { errors: "Negative numbers not allowed: #{negatives.join(',')}", result: nil }
        else
          sum = number_string.split(delimiter).map(&:to_i).sum
          { errors: nil, result: sum }
        end
        
    end
  
    private
  
    def extract_delimiter_and_numbers(string)

      negatives = string.scan(/-\d+/)

      if string.start_with?("//")
        custom_delimiter = Regexp.escape(string[2])
        number_body = string[4..] # skip `//<delimiter>\n`
        delimiter = /#{custom_delimiter}/
      else
        delimiter = /,|\n/
        number_body = string
      end
  
      [negatives, delimiter, number_body]
    end
  end
  