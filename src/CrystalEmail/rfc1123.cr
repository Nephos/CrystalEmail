# require "./core"

module CrystalEmail
  # a Domain Name follows the Rfc1123: https://tools.ietf.org/html/rfc1123
  class Rfc1123 < Core
    # one valid character for domain part (first name first character)
    ATEXT_FIRST_FIRST = "([A-Za-z])"
    # one valid character for domain part (first name all other characters)
    ATEXT_FIRST_ALL = "([A-Za-z0-9])"
    # one valid character for domain part (all other names)
    ATEXT_ALL = "([A-Za-z0-9-])"

    # a valid string for domain part (first name)
    ATOM_FIRST = "#{ATEXT_FIRST_FIRST}#{ATEXT_ALL}{0,62}"
    # a valid string for domain part (all other names)
    ATOM_ALL = "#{ATEXT_FIRST_ALL}#{ATEXT_ALL}{0,62}"

    # a valid string with subdomains, separated by dots for domain part as IPV4
    IPV4 = "(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)"
    # a valid string with subdomains, separated by dots for domain part as Domain Name
    DOT_ATOM_TEXT = "((#{ATOM_ALL}\\.)*#{ATOM_FIRST})"

    # email grammar
    VALIDE = "(?<domain>(?!.{254,})((#{DOT_ATOM_TEXT})|(#{IPV4})))"

    # regexp to validate complete email
    REGEXP = /\A#{VALIDE}\Z/

    def self.regexp
      REGEXP
    end

    module String
      # Check if the current [::String] instance is a valid domain
      # @return [TrueClass or FalseClass]
      def is_domain? : Bool
        CrystalEmail::Rfc1123.validates? self
      end
    end
  end
end
