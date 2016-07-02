module CrystalEmail
  # Abstract class to inherit and complete by adding the REGEXP constant
  class Core
    # Check if the {::String} is a valid email.
    # @param str [::String] string to match
    # @raise [ArgumentError] if str is not a String
    # @return [TrueClass or FalseClass]
    def self.validates?(str : String) : Bool
      !!match(str)
    end

    # Check if the string is a valid email and details how
    # @param str [::String] string to match
    # @raise [ArgumentError] if str is not a String
    # @return [MatchData or NilClass] matched email with the keys "local" and "domain"
    def self.match(str : String)
      raise ArgumentError.new "Cannot validate a `#{str.class}`. Only `String` can be." unless str.is_a?(String)
      str.match regexp
    end

    # @return [Regexp] to erase in the children
    def self.regexp
      raise NoMethodError.new "Not implemented in #{self.class}"
    end
  end
end
