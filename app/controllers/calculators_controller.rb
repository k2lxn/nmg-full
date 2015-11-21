class CalculatorsController < ApplicationController
  def index
  end

  def show
  	@calculator = Calculator.find(params[:id])
  end
  
  def calculate
  	@result = 42
  end
  
  private
  
  	def calculator_params
  		params.require(:calculator).permit(:name, :input_fields)
  	end
end
