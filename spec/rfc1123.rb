class TestRubyEmailRfc1123 < Test::Unit::TestCase

  def test_simple_true
    assert RubyEmail::Rfc1123.validates?("toto")
    assert RubyEmail::Rfc1123.validates?("toto.toto")
    assert RubyEmail::Rfc1123.validates?("toto.toto.toto")
    assert RubyEmail::Rfc1123.validates?("toto.toto.toto.toto")
  end

  def test_simple_false
    assert !RubyEmail::Rfc1123.validates?("-1")
    assert !RubyEmail::Rfc1123.validates?("t@")
    assert !RubyEmail::Rfc1123.validates?("@t")
  end

  def test_plus_true
    assert RubyEmail::Rfc1123.validates?("mail.com")
    assert RubyEmail::Rfc1123.validates?("0mail.com")
    assert RubyEmail::Rfc1123.validates?("t1oto")
    assert RubyEmail::Rfc1123.validates?("t1oto")
    assert RubyEmail::Rfc1123.validates?("1.toto")
    assert RubyEmail::Rfc1123.validates?("127.0.0.1")
    assert RubyEmail::Rfc1123.validates?("255.254.251.0")
    assert RubyEmail::Rfc1123.validates?("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
    assert RubyEmail::Rfc1123.validates?("a" * 63)
    assert RubyEmail::Rfc1123.validates?("a" * 63 + ".a")
    assert RubyEmail::Rfc1123.validates?("aaa" + ".a"*125)
  end

  def test_plus_false
    assert !RubyEmail::Rfc1123.validates?("some things")
    assert !RubyEmail::Rfc1123.validates?("toto;toto")
    assert !RubyEmail::Rfc1123.validates?("some things")
    assert !RubyEmail::Rfc1123.validates?("toto,toto")
    assert !RubyEmail::Rfc1123.validates?("toto()toto")
    assert !RubyEmail::Rfc1123.validates?("toto[]toto")
    assert !RubyEmail::Rfc1123.validates?("toto:toto")
    assert !RubyEmail::Rfc1123.validates?("toto<>toto")
    assert !RubyEmail::Rfc1123.validates?("toto\\toto")
    assert !RubyEmail::Rfc1123.validates?("toto\"toto")
    assert !RubyEmail::Rfc1123.validates?("-root")
    assert !RubyEmail::Rfc1123.validates?("0.0.0.-1")
    assert !RubyEmail::Rfc1123.validates?("256.255.254.1")
    assert !RubyEmail::Rfc1123.validates?("1")
    assert !RubyEmail::Rfc1123.validates?("111")
    assert !RubyEmail::Rfc1123.validates?("a.1")
    assert !RubyEmail::Rfc1123.validates?("1.1")
    assert !RubyEmail::Rfc1123.validates?("a" * 64)
    assert !RubyEmail::Rfc1123.validates?("aaaa" + ".a"*125)
  end

  def test_match
    m = RubyEmail::Rfc1123.match "toto.toto.toto.toto"
    assert m.names & %w(domain)
    assert_equal "toto.toto.toto.toto", m["domain"]
  end

  def test_string
    assert_raise { "toto@toto".is_domain? }
    require_relative '../lib/ruby_email/rfc1123/string'
    assert "toto".is_domain?
    assert !"___".is_domain?
  end

  def test_exceptions
    assert_raise { RubyEmail::Rfc1123.match 1 }
    assert_raise { RubyEmail::Rfc1123.validates? 1.0 }
    assert_raise { RubyEmail::Rfc1123.validates? /toto/ }
    assert_raise { RubyEmail::Rfc1123.validates? :ok }
    assert_raise { RubyEmail::Rfc1123.validates? Class }
  end

end
