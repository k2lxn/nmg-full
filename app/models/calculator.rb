class Calculator < ActiveRecord::Base
	has_and_belongs_to_many :input_fields
	has_and_belongs_to_many :output_fields

	def self.mortgage
		result = {"Monthly payment" => 42, "Total payments" => 37, "Total interest" => 3}
	end
end
