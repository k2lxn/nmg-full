class Calculator < ActiveRecord::Base
	has_and_belongs_to_many :input_fields

	# Must return a hash with three keys: Monthly payment, Total payments, Total interest
	def self.mortgage
		result = {"Monthly payment" => 42, "Total payments" => 37, "Total interest" => 3}
	end
	
	
	# Must return a hash with three keys: Home price, Loan amount, Monthly Payment
	def self.prequalify
		result = {"Home price" => 42, "Loan amount" => 37, "Monthly Payment" => 3}
	end
	
	
	# Must return a hash with three keys: New mortgage, Monthly savings, Interest savings
	def self.refinance
		result = {"New mortgage" => 42, "Monthly savings" => 37, "Interest savings" => 3}
	end
end
