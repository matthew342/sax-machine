module SAXMachine
  class SAXConfig
    
    class CollectionConfig
      attr_reader :name
      
      def initialize(name, options)
        @name   = name.to_s
        @class  = options[:class]
        @class_args = options[:class_args]
        @as     = options[:as].to_s
        
        if options.has_key?(:with)
          @with = options[:with].to_a.map {|(k,v)| [k.to_s, v.to_s] }
        end
      end
      
      def accessor
        as
      end
      
      def attrs_match?(attrs)
        return true unless @with

        @with.all? do |k,v|
          if pair = attrs.assoc(k)
            pair.last == v
          end
        end
      end

      def data_class
        @class || @name
      end      
      
      def data_class_args
        @class_args
      end
      
    protected
      
      def as
        @as
      end
      
    end
    
  end
end
