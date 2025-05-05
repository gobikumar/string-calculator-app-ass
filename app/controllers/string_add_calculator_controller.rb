class StringAddCalculatorController < ApplicationController
    def add
        render_add_view
    end
    
    def calculate
        
        input = params[:input].to_s
        result_data = StringAddCalculator.new(numbers: input).execute
        respond_to do |format|
          format.html { render :add, locals: { errors: result_data[:errors], result: result_data[:result], input: input } }
          format.json { render json: { errors: result_data[:errors], result: result_data[:result], input: input } }
        end
    end
    
    private
    
    def render_add_view(errors: nil, result: nil, input: nil)
        render :add, locals: { errors:, result:, input: }
    end 

end
