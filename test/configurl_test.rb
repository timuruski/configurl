require 'test_helper'

class ConfigUrlTest < Minitest::Test
  TEST_URLS = [
    'https://api.example.com:8080/project-x?api_key=abc123#data',
  ]

  def test_that_it_has_a_version_number
    refute_nil ::ConfigUrl::VERSION
  end

  # Test delegation of getter methods by checking for zero arity.
  TEST_URLS.each do |url|
    parsed_url = URI(url)
    (parsed_url.public_methods - Object.new.public_methods)
      .map { |m| parsed_url.method(m) }
      .select { |m| m.arity == 0 }
      .each do |m|
          define_method("test_delegates_#{m.name}") do
            service = ConfigUrl.new(url)
            assert_equal parsed_url.send(m.name), service.send(m.name)
          end
        end

  end
end
