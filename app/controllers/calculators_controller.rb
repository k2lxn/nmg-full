class CalculatorsController < ApplicationController
  def index
  end

  def show
  	@calculator = Calculator.find(params[:id])
  end
  
  def calculate
  	@calculator = Calculator.find(params[:id])
  	
  	# Determine correct operation to call for given calculator
  	#operation = @calculator.operation
  	operations = {"Mortgage Payment" => Calculator.mortgage,
  								"Prequalification" => Calculator.prequalify, 
  								"Refinance" => Calculator.refinance }
  	operation = operations[@calculator.name]  # DEV ONLY
  	
  	# Call the operation in calculators.rb
  	@result = operation
  	
  	render :show
  end
  
  private
  
  	def calculator_params
  		params.require(:calculator).permit(:name, :input_fields)
  	end
end
