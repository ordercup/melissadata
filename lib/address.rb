$KCODE = 'UTF8'
module MelissaData
  class Address < Base
    attr_accessor :address, :address2, :city, :state, :zipcode, :country, :phone, :plus4, :area_code_of_zipcode

    def initialize(attributes = {})
      define_instance_variables( attributes )
      verify
    end
    
    def valid?
      @address_status_code && @address_status_code == 'V'
    end
    
    def zipcode
      @zip || @zipcode || ''
    end
        
    private
    
    # Returns a String
    #  This method builds the xml request for the Address Object service.
    #
    def xml
      data = ''
      builder = Builder::XmlMarkup.new(:target => data, :indent => 2)
      builder.instruct!
      builder.RecordSet do |b|
        b.CustomerID customer_id
        b.Record do |b|
          b.Address @address
          b.Address2 @address2
          b.City @city
          b.State @state
          b.Country @country
          b.Zip @zipcode
          b.Plus4 @plus4
          b.Phone @telephone
          b.AreaCodeOfZip @area_code_of_zipcode
          b.ErrorString{}
          b.AddressStatusCode{}
          b.DPVStatusCode{}
          b.DPVSuiteStatusCode{}
          b.CMRA{}
          b.AddressErrorCode{}
          b.AddressErrorString{}
          b.PhoneErrorCode{}
          b.AddressTypeCode{}
          b.AddressTypeString{}
          b.RBDI{}
          b.AddressStatusCode{}
          b.PhoneErrorCode{}
        end
      end
      data
    end
    
    def verify
      response = request('/xml.asp', xml)
      body = if response.success?
        response.body
      else
        # handle the error
        'Error: ' + response.body
      end
      update_from_response( body )
      return self
    end
    
    def method_missing(args, &block)
      instance_variable_get(:"@#{args.to_s}")
    end
    
    def define_instance_variables( attributes_hash = {})
      attributes_hash.each do |key, value|
        value = value.is_a?(Array) ? value[0] : value
        instance_variable_set(:"@#{key.to_s.underscore}", value.to_s.strip)
      end
    end
    
    def update_from_response( body )
      hash = Crack::XML.parse( body )['RecordSet']['Record'] rescue {}
      define_instance_variables( hash )
    end
  end
end