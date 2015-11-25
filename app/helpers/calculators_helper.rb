module CalculatorsHelper
	
	# Takes an InputField
	def select_options(field)
  	select_options = {"term_options" => [["15yr", 15], ["30yr", 30]], 
							"rate_options" => (3.0..5.5).step(0.125),
							"down_options" => (10.0..30.0).step(0.25)}
  	select_options[field.options]
  end
end
