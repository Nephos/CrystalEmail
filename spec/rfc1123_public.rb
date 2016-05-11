class TestRubyEmailRfc1123Public < Test::Unit::TestCase
  def test_simpe
    assert RubyEmail::Rfc1123::Public.validates?("toto.toto")
    assert RubyEmail::Rfc1123::Public.validates?("toto.toto.toto")
    assert RubyEmail::Rfc1123::Public.validates?("toto.toto.toto.toto")
    assert !RubyEmail::Rfc1123::Public.validates?("toto")
    assert RubyEmail::Rfc1123::Public.match("toto.toto")
  end

  def test_string
    assert_raise { "toto.toto".is_public_domain? }
    require_relative '../lib/ruby_email/rfc1123/public/string'
    assert "toto.toto".is_public_domain?
    assert !"toto".is_public_domain?
  end
end
