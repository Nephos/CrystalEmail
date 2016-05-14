require "./spec_helper"
require "../src/CrystalEmail"

describe CrystalEmail do
  it "works" do
    CrystalEmail::Rfc5322.validates?("toto@tata").should        eq(true)
    CrystalEmail::Rfc5322.validates?("toto@tata.tata").should   eq(true)
    CrystalEmail::Rfc5322.validates?("a.b@dom").should          eq(true)
    CrystalEmail::Rfc5322.validates?("a.b.c@dom.ex.fe").should  eq(true)
    CrystalEmail::Rfc5322.validates?("-@x").should              eq(true)
    CrystalEmail::Rfc5322.validates?("u@1.1.1.1").should        eq(true)
    CrystalEmail::Rfc5322.validates?("u@a-a").should            eq(true)
  end

  it "does not works" do
    CrystalEmail::Rfc5322.validates?("toto@").should            eq(false) # no domain
    CrystalEmail::Rfc5322.validates?("@tata.tata").should       eq(false) # no user
    CrystalEmail::Rfc5322.validates?("a.b.dom").should          eq(false) # no @
    CrystalEmail::Rfc5322.validates?("a.b.c@dom.ex.1").should   eq(false) # first dom has to begin with a alpha
    CrystalEmail::Rfc5322.validates?("u@256.1.1.1").should      eq(false) # not a valid ip
    CrystalEmail::Rfc5322.validates?("u@-a").should             eq(false) # not a valid dom
    CrystalEmail::Rfc5322.validates?("u@-a.a").should           eq(false) # not a valid dom
  end

  it "test public" do
    CrystalEmail::Rfc1123::Public.validates?("toto").should             eq(false)
    CrystalEmail::Rfc1123::Public.validates?("1.1.1.1").should          eq(false)
    CrystalEmail::Rfc1123::Public.validates?("toto.toto").should        eq(true)
    CrystalEmail::Rfc5322::Public.validates?("toto@toto").should        eq(false)
    CrystalEmail::Rfc5322::Public.validates?("toto@1.1.1.1").should     eq(false)
    CrystalEmail::Rfc5322::Public.validates?("toto@toto.toto").should   eq(true)
  end

  it "test string helpers" do
    ("*".is_domain?).should                       eq(false)
    ("toto.toto".is_domain?).should               eq(true)
    ("toto".is_public_domain?).should             eq(false)
    ("toto.toto".is_public_domain?).should        eq(true)
    ("toto".is_email?).should                     eq(false)
    ("toto@toto.toto".is_email?).should           eq(true)
    ("toto@toto".is_public_email?).should         eq(false)
    ("toto@toto.toto".is_public_email?).should    eq(true)
  end

end
