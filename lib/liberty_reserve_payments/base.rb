module LibertyReservePayments
  class Base
    include AttrRequired, AttrOptional
    def initialize(attributes = {})
      if attributes.is_a?(Hash)
        (required_attributes + optional_attributes).each do |key|
          value = attributes[key]
          self.send "#{key}=", value
        end
      end
      attr_missing!
    end
  end
end