# A RFC compliant Email validator

#### Prelude
- What is an [Email Address](https://en.wikipedia.org/wiki/Email_address) ?
- What is a [Domain Name](https://en.wikipedia.org/wiki/Hostname) ?

#### Compliance
- Compliant to the [Rfc 5322](https://tools.ietf.org/html/rfc5322).
- Compliant to the [Rfc 1123](https://tools.ietf.org/html/rfc1123).

#### To do
- To do : [rfc 6530](https://tools.ietf.org/html/rfc6530).
- To do : Implement IPv6

#### Notes
- No ipv6 for now
- No escaped characters
- Public email validity (no raw ip, domain withour root domain, ...)


## Installation

Works with crystal 0.17 - 0.27.0

Add this to your application's `shard.yml`:

```yaml
dependencies:
  CrystalEmail:
      git: https://git.sceptique.eu/Sceptique/CrystalEmail
```

## Usage in Crystal

```crystal
require "CrystalEmail"

# Pure Rfc5322
CrystalEmail::Rfc5322.validates? "toto@tata" # => true
CrystalEmail::Rfc5322.match "toto@tata" # => #<MatchData "toto@tata" local:"toto" domain:"tata">
CrystalEmail::Rfc5322.validates? "toto" # => false
CrystalEmail::Rfc5322.match "toto" # => nil

# Rfc5322 + Internet basic usage
CrystalEmail::Rfc5322::Public.validates? "toto@tata.com" # => true
CrystalEmail::Rfc5322::Public.match "toto@tata.com" # => #<MatchData "toto@tata" local:"toto" domain:"tata.com">

"toto@toto.toto".is_email? # => true
```


## Contributes !

Find a bug ? Want a new feature ?
Create a clear pull request and we'll see :)

- Sceptique
