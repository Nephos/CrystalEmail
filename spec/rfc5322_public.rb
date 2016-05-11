class TestRubyEmailRfc5322Public < Test::Unit::TestCase
  def test_simpe
    assert RubyEmail::Rfc5322::Public.validates?("toto@toto.toto")
    assert RubyEmail::Rfc5322::Public.validates?("toto@toto.toto.toto")
    assert RubyEmail::Rfc5322::Public.validates?("toto@toto.toto.toto.toto")
    assert !RubyEmail::Rfc5322::Public.validates?("toto@toto")
    assert RubyEmail::Rfc5322::Public.match("toto@toto.toto")
  end

  def test_string
    assert_raise { "toto@toto.toto".is_public_email? }
    require_relative '../lib/ruby_email/rfc5322/public/string'
    assert "toto@toto.toto".is_public_email?
    assert !"toto@toto".is_public_email?
  end
end
