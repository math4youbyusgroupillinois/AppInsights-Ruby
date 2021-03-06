require_relative 'json_serializable'

module ApplicationInsights
  module Channel
    module Contracts
      # Data contract class for type ExceptionData.
      class ExceptionData < JsonSerializable
        # Initializes a new instance of the ExceptionData class.
        def initialize(options={})
          defaults = {
            'ver' => 2,
            'handledAt' => nil,
            'exceptions' => [],
            'severityLevel' => nil,
            'properties' => {},
            'measurements' => {}
          }
          values = {
            'ver' => 2,
            'handledAt' => nil,
            'exceptions' => []
          }
          super defaults, values, options
        end
        
        # Gets the ver property.
        def ver
          @values['ver']
        end
        
        # Sets the ver property.
        def ver=(value)
          @values['ver'] = value
        end
        
        # Gets the handled_at property.
        def handled_at
          @values['handledAt']
        end
        
        # Sets the handled_at property.
        def handled_at=(value)
          @values['handledAt'] = value
        end
        
        # Gets the exceptions property.
        def exceptions
          @values['exceptions']
        end
        
        # Sets the exceptions property.
        def exceptions=(value)
          @values['exceptions'] = value
        end
        
        # Gets the severity_level property.
        def severity_level
          return @values['severityLevel'] if @values.key?('severityLevel')
          @defaults['severityLevel']
        end
        
        # Sets the severity_level property.
        def severity_level=(value)
          if value == @defaults['severityLevel']
            @values.delete 'severityLevel' if @values.key? 'severityLevel'
          else
            @values['severityLevel'] = value
          end
        end
        
        # Gets the properties property.
        def properties
          return @values['properties'] if @values.key?('properties')
          @values['properties'] = {}
          @values['properties']
        end
        
        # Sets the properties property.
        def properties=(value)
          if value == @defaults['properties']
            @values.delete 'properties' if @values.key? 'properties'
          else
            @values['properties'] = value
          end
        end
        
        # Gets the measurements property.
        def measurements
          return @values['measurements'] if @values.key?('measurements')
          @values['measurements'] = {}
          @values['measurements']
        end
        
        # Sets the measurements property.
        def measurements=(value)
          if value == @defaults['measurements']
            @values.delete 'measurements' if @values.key? 'measurements'
          else
            @values['measurements'] = value
          end
        end
      end
    end
  end
end
