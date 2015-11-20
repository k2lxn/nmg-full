# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



# Create Calculators
%w[Prequalification Mortgage_Payment Refinance].each do |name|
	Calculator.create(name: name)
end

# Create Input Fields
[{name: "Monthly income", tag: "text"}, {name: "Monthly debt", tag: "text"}, 
	{name: "Interest rate", tag: "select"}, {name: "Term", tag: "select"}, {name:
	"Down payment(%)", tag: "select"}, {name: "Loan amount", tag: "text"}].each do |input|
	InputField.create(name: input[:name], tag: input[:tag])
end


# Mortgage Payment Input Fields
loan = InputField.find_or_create_by(name: "Loan amount")
rate = InputField.find_or_create_by(name: "Interest rate")
term = InputField.find_or_create_by(name: "Term")

mortgage_calc = Calculator.find_or_create_by(name: "Mortgage_Payment")
mortgage_calc.input_fields<<loan
mortgage_calc.input_fields<<rate
mortgage_calc.input_fields<<term