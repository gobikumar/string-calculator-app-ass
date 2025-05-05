require 'rails_helper'

RSpec.describe StringAddCalculator do
  describe '#execute' do
    it 'returns 0 for an empty string' do
      result = described_class.new(numbers: '').execute
      expect(result).to eq({ errors: nil, result: 0 })
    end

    it 'adds numbers separated by comma or newline' do
      result = described_class.new(numbers: "1,2\n3").execute
      expect(result).to eq({ errors: nil, result: 6 })
    end

    it 'supports custom delimiter' do
      result = described_class.new(numbers: "//;\n1;2;3").execute
      expect(result).to eq({ errors: nil, result: 6 })
    end

    it 'returns error for negative numbers' do
        result = described_class.new(numbers: '1,-2,3,-4').execute
        expect(result[:errors]).to include('Negative numbers not allowed: -2,-4')
        expect(result[:result]).to be_nil
    end
  
  end
end
