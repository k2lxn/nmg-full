class CalculatorsController < ApplicationController
  def index
  end

  def show
  	@calculator = Calculator.find(params[:id])
  end
  
  def calculate
  	@calculator = Calculator.find(params[:id])
  	@result = 42
  	
  	render :show
  end
  
  private
  
  	def calculator_params
  		params.require(:calculator).permit(:name, :input_fields)
  	end
end
