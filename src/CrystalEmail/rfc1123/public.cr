require "../rfc1123"

module CrystalEmail
  class Rfc1123

    # Internet realist version of {Rfc5322}. It requires 2 names (a.b).
    class Public < Rfc1123
      # a valid string with subdomains, separated by dots for domain part as Domain Name
      DOT_ATOM_TEXT = "((#{ATOM_ALL}\\.)+#{ATOM_FIRST})"

      # email grammar
      VALIDE = "(?<domain>(?!.{254,})((#{DOT_ATOM_TEXT})))"
      REGEXP = /\A#{VALIDE}\Z/
      def self.regexp ; return REGEXP; end

      module String
        # Check if the current [::String] instance is a valid domain on internet
        # @return [TrueClass or FalseClass]
        def is_public_domain?
          CrystalEmail::Rfc1123::Public.validates? self
        end
      end
    end

  end
end
