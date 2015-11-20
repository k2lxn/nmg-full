class Calculator < ActiveRecord::Base
	has_and_belongs_to_many :input_fields
	has_and_belongs_to_many :output_fields
end
