module CustomMatchers

	RSpec::Matchers.define :have_row do |container, key, value = nil|
		match do |actual|
			if value
				actual.should have_selector("#{container} tr", :content => key) do |row|
					row.should contain(value)
				end
			else
				actual.should have_selector("#{container} tr", :content => key)
			end
		end
	
		failure_message_for_should do |actual|
			"expected #{actual.inspect} to contain #{expected.inspect}"
		end
	
	end
	
	RSpec::Matchers.define :have_heading do |expected|
		match do |actual|
			actual.should have_selector("#rack_bug_toolbar li") do |heading|
				heading.should contain(expected)
			end
		end
		
		failure_message_for_should do |actual|
			"expected #{actual.inspect} to contain #{expected.inspect}"
		end
	
	end
end