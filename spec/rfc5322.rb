class TestRubyEmailRfc5322 < Test::Unit::TestCase

  def test_simple_true
    assert RubyEmail::Rfc5322.validates?("toto@toto")
    assert RubyEmail::Rfc5322.validates?("toto@toto.toto")
    assert RubyEmail::Rfc5322.validates?("toto@toto.toto.toto")
    assert RubyEmail::Rfc5322.validates?("toto@toto.toto.toto.toto")
  end

  def test_simple_false
    assert !RubyEmail::Rfc5322.validates?("t")
    assert !RubyEmail::Rfc5322.validates?("t@")
    assert !RubyEmail::Rfc5322.validates?("@t")
  end

  def test_plus_true
    assert RubyEmail::Rfc5322.validates?("i'am%toto@here")
    assert RubyEmail::Rfc5322.validates?("ich-bin-toto@ta-ta")
    assert RubyEmail::Rfc5322.validates?("arthur+spam@mail.com")
    assert RubyEmail::Rfc5322.validates?("arthur+spam@0mail.com")
    assert RubyEmail::Rfc5322.validates?("arthur+spam@127.0.0.1")
    assert RubyEmail::Rfc5322.validates?("arthur+spam@255.254.251.0")
  end

  def test_plus_false
    assert !RubyEmail::Rfc5322.validates?("i have @ some things")
    assert !RubyEmail::Rfc5322.validates?("toto;toto@toto;toto")
    assert !RubyEmail::Rfc5322.validates?("toto,toto@toto,toto")
    assert !RubyEmail::Rfc5322.validates?("toto()toto@toto()toto")
    assert !RubyEmail::Rfc5322.validates?("toto[]toto@toto[]toto")
    assert !RubyEmail::Rfc5322.validates?("toto:toto@toto:toto")
    assert !RubyEmail::Rfc5322.validates?("toto<>toto@toto<>toto")
    assert !RubyEmail::Rfc5322.validates?("toto\\toto@toto\\toto")
    assert !RubyEmail::Rfc5322.validates?("toto\"toto@toto\"toto")
    assert !RubyEmail::Rfc5322.validates?("arthur+spam@-root")
    assert !RubyEmail::Rfc5322.validates?("arthur+spam@0.0.0.-1")
    assert !RubyEmail::Rfc5322.validates?("arthur+spam@256.255.254.1")
  end

  def test_match
    m = RubyEmail::Rfc5322.match "toto@toto.toto.toto.toto"
    assert m.names & %w(local domain)
    assert_equal "toto", m["local"]
    assert_equal "toto.toto.toto.toto", m["domain"]
  end

  def test_string
    assert_raise { "toto@toto".is_email? }
    require_relative '../lib/ruby_email/rfc5322/string'
    assert "toto@toto".is_email?
    assert !"toto".is_email?
  end

  def test_exceptions
    assert_raise { RubyEmail::Rfc5322.match 1 }
    assert_raise { RubyEmail::Rfc5322.validates? 1.0 }
    assert_raise { RubyEmail::Rfc5322.validates? /toto/ }
    assert_raise { RubyEmail::Rfc5322.validates? :ok }
    assert_raise { RubyEmail::Rfc5322.validates? Class }
  end

end
