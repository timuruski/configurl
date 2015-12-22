require 'uri'
require 'delegate'

class ConfigUrl < Delegator
  VERSION = "0.1.0"

  # extend Forwardable
  # def_delegators :@url, :scheme, :host, :port, :path, :query, :fragment
  # def_delegator :@url, :scheme, :protocol

  def initialize(url)
    @url = URI(url)
    super(@url)
  end

  def __getobj__
    @url
  end

  def __setobj__(obj)
    @url = obj
  end
end
