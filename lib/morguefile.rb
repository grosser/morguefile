require 'digest/sha2'
require 'json'
require 'openssl'
require 'open-uri'

class Morguefile
  class << self
    attr_accessor :key, :secret
  end

  def self.find_image(term)
    client = new(key || ENV.fetch('MORGUEFILE_KEY'), secret || ENV.fetch('MORGUEFILE_SECRET'))
    result = client.search(term)
    return unless result = result['doc'] # 404 -> nothing
    result.first.fetch('Archive').fetch('file_path_large')
  end

  def initialize(key, secret)
    @key = key
    @secret = secret
  end

  def search(term)
    response = get("/archive/search/1/?q=#{CGI.escape(term)}&sort=pop&photo_lib=morgueFile")
    JSON.parse(response)
  end

  private

  def get(path)
    signed = path.split('?').first.split("/").join("")
    signature = OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha256'), @key, signed)
    url = "http://www.morguefile.com#{path}&key=#{@key}&sig=#{signature}"
    open(url).read
  end
end
