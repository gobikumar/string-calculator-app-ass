class StringAddCalculatorController < ApplicationController
    def add
        render_add_view
    end
    
    def calculate
        
        input = params[:input].to_s
        result_data = StringAddCalculator.new(numbers: input).execute
        format.json { render json: result_data.merge(input:) }
aA
        respond_to do |format|
            
          format.html do
            render :add, locals: {
                errors: service[:errors],
                result: service[:result],
                input: input
              }
            end      
        end
    end
    
    private
    
    def render_add_view(errors: nil, result: nil, input: nil)
        render :add, locals: { errors:, result:, input: }
    end 

end
