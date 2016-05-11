# A RFC compliant Email validator

- What is an [Email Address](https://en.wikipedia.org/wiki/Email_address) ?
- What is a [Domain Name](https://en.wikipedia.org/wiki/Hostname) ?

- Compliant to the [Rfc 5322](https://tools.ietf.org/html/rfc5322).
- Compliant to the [Rfc 1123](https://tools.ietf.org/html/rfc1123).

- To do [rfc 6530](https://tools.ietf.org/html/rfc6530).


## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  CrystalEmail:
      github: pouleta/CrystalEmail      
```

## Usage in Crystal

```crystal
require "CrystalEmailLib"

# Pure Rfc5322
CrystalEmail::Rfc5322.validates? "toto@tata" # => true
CrystalEmail::Rfc5322.match "toto@tata" # => #<MatchData "toto@tata" local:"toto" domain:"tata">
CrystalEmail::Rfc5322.validates? "toto" # => false
CrystalEmail::Rfc5322.match "toto" # => nil

# Rfc5322 + Internet basic usage
CrystalEmail::Rfc5322::Public.validates? "toto@tata.com" # => true
CrystalEmail::Rfc5322::Public.match "toto@tata.com" # => #<MatchData "toto@tata" local:"toto" domain:"tata.com">

```


## Contributes !

Find a bug ? Want a new feature ?
Create a clear pull request and we'll see :)

- Nephos (poulet_a)
