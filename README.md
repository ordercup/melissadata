Melissa Data Address Verification Gem
---
	This is a simple Gem for use with the Melissa Data Address validation API.
	
	*Configuration*
	
	You will need to have a config/melissa_data.yml file with your customer_id provided by Melissa Data.
	You can learn more about Melissa Data here http://www.melissadata.com
	
	*Example usage*
	
		address = MelissaData::Address.new(
		  :address => '1 Infinite Loop', 
		  :city => 'Cupertino', 
		  :state => 'CA', 
		  :zipcode => '95014',
		  :country => 'United States'
		)
		
		
		address.valid? #=> true
		
		address2 = MelissaData::Address.new(
		  :address => '1019827111 Infinite Loop', 
		  :city => 'Cupertino', 
		  :state => 'CA', 
		  :zipcode => '95014',
		  :country => 'United States'
		)
		
		address2.valid? #=> false
		
		
		
	This will return a Ruby Object you can use to easily check the results
	of an address verification response in your app.
	
	*Magic Methods*
	
	address_type_string
	zip
	dpv_status_code
	address_error_code
	plus4
	error_string
	cmra
	dpv_suite_status_code
	address_error_string
	address_type_code
	phone_error_code
	address_status_code
	rbdi