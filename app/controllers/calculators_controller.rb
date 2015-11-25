class CalculatorsController < ApplicationController
  def index
  end

  def show
  	@calculator = Calculator.find(params[:id])
  	@inputs = @calculator.input_fields.to_a
  end
  
  def calculate
  	@calculator = Calculator.find(params[:id])
  	@inputs = @calculator.input_fields.to_a
  	
  	# Determine correct operation to call for given calculator
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
