module MelissaData
  class Base
    
    private
    
    def customer_id
      @customer_id ||= YAML.load_file(config_file)["customer_id"]
    end
    
    def config_file
      File.join(Rails.root, 'config', 'melissa_data.yml')
    end
    
    def base_uri(path='')
      'http://xml.melissadata.com' + path
    end
    
    def request(path, xml)
      response = Typhoeus::Request.get(base_uri(path), { 
        :headers => {'Content-Type' => 'application/x-www-form-urlencoded'},
        :body => xml
      })
      return response
    end    
  end
end