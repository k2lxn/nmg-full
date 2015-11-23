# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



# Create Calculators
%w[Prequalification Mortgage\ Payment Refinance].each do |name|
	Calculator.create(name: name)
end

# Create Input Fields
inputs_data = [{name: "Monthly income", tag: "text"}, 
							{name: "Monthly debt", tag: "text"}, 
							{name: "Interest rate", tag: "select", options: "rate_options"}, 
							{name: "Term", tag: "select", options: "term_options"}, 
							{name: "Down payment(%)", tag: "select", options: "down_options"}, 
							{name: "Loan amount", tag: "text"}]

inputs_data.each do |input|	
		new_field = InputField.create(name: input[:name], tag: input[:tag])
		if input[:options].nil? == false
			new_field.options = input[:options]
			new_field.save
		end
end


# Add Input Fields to Mortgage Payment Calculator
loan = InputField.find_or_create_by(name: "Loan amount")
rate = InputField.find_or_create_by(name: "Interest rate")
term = InputField.find_or_create_by(name: "Term")

mortgage_calc = Calculator.find_or_create_by(name: "Mortgage_Payment")
mortgage_calc.input_fields<<loan
mortgage_calc.input_fields<<rate
mortgage_calc.input_fields<<term