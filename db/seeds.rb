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
							{name: "Loan amount", tag: "text"},
							{name: "New rate", tag: "select", options: "rate_options"},
							{name: "New term", tag: "select", options: "term_options"},
							{name: "Payments made", tag: "text" },
							{name: "Desired Loan Terms", tag: "heading"},
							{name: "Original Loan", tag: "heading"},
							{name: "Refinance", tag: "heading"}]

inputs_data.each do |input|	
		new_field = InputField.create(name: input[:name], tag: input[:tag])
		if input[:options].nil? == false
			new_field.options = input[:options]
			new_field.save
		end
end

# Create associations between InputFields and Calculators
loan = InputField.find_or_create_by(name: "Loan amount")
rate = InputField.find_or_create_by(name: "Interest rate")
term = InputField.find_or_create_by(name: "Term")
income = InputField.find_or_create_by(name: "Monthly income")
debt = InputField.find_or_create_by(name: "Monthly debt")
down = InputField.find_or_create_by(name: "Down payment(%)")
payments = InputField.find_or_create_by(name: "Payments made")
new_rate = InputField.find_or_create_by(name: "New rate")
new_term = InputField.find_or_create_by(name: "New term")


# add inputs to Mortgage Payment calculator
mortgage_calc = Calculator.find_or_create_by(name: "Mortgage Payment")
mortgage_calc.input_fields<<loan
mortgage_calc.input_fields<<rate
mortgage_calc.input_fields<<term

# add inputs to Prequalification calculator
prequal_calc = Calculator.find_or_create_by(name: "Prequalification")
prequal_calc.input_fields<<income
prequal_calc.input_fields<<debt
heading = InputField.find_or_create_by(name: "Desired Loan Terms")
prequal_calc.input_fields<<heading
prequal_calc.input_fields<<rate
prequal_calc.input_fields<<term
prequal_calc.input_fields<<down

# add inputs to Refinance calculator
refinance_calc = Calculator.find_or_create_by(name: "Refinance")
heading = InputField.find_or_create_by(name: "Original Loan")
refinance_calc.input_fields<<heading
refinance_calc.input_fields<<loan
refinance_calc.input_fields<<rate
refinance_calc.input_fields<<term
refinance_calc.input_fields<<payments
heading = InputField.find_or_create_by(name: "Refinance")
refinance_calc.input_fields<<heading
refinance_calc.input_fields<<new_rate
refinance_calc.input_fields<<new_term
