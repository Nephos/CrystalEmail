# require "core"
# require "rfc1123"

module CrystalEmail
  # an Email Address follows the Rfc5322: http://www.ietf.org/rfc/rfc5322.txt
  # a Domain Name follows the Rfc1123: https://tools.ietf.org/html/rfc1123
  # The Rfc5322 designate an email with the format local@domain, where
  #  - local is a string of US-ASCII characters, without some symboles.
  # - domain is a valid Domain Name
  class Rfc5322 < Core
    # one valid character for local part (do not take escaped because the Rfc prefere to avoid them)
    ATEXT = "([A-Za-z0-9!#\\$%&\\'*\\+\\-/=\\?\\^_`\\{\\}\\|~])"

    # a valid string for local part
    ATOM = "#{ATEXT}+"

    # a valid string with subdomains, separated by dots for local part
    DOT_ATOM_TEXT = "(#{ATOM})(\\.#{ATOM})*"

    # email grammar
    VALIDE = "(?<local>#{DOT_ATOM_TEXT})@(#{Rfc1123::VALIDE})"

    # regexp to validate complete email
    REGEXP = /\A#{VALIDE}\Z/

    def self.regexp
      REGEXP
    end

    module String
      # Check if the current [::String] instance is a valid email
      # @return [TrueClass or FalseClass]
      def is_email? : Bool
        CrystalEmail::Rfc5322.validates? self
      end
    end
  end
end
