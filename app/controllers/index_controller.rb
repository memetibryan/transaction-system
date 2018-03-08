class IndexController < ApplicationController
	def index
		require 'net/http'
		require 'net/https'
		require 'uri'

		uri = URI('https://sandbox.safaricom.co.ke/mpesa/c2b/v1/registerurl')

		http = Net::HTTP.new(uri.host, uri.port)
		http.use_ssl = true
		http.verify_mode = OpenSSL::SSL::VERIFY_NONE

		request = Net::HTTP::Get.new(uri)
		request["accept"] = 'application/json'
		request["content-type"] = 'application/json'
		request["authorization"] = 'Bearer f1lRsA21I4t3Q70irZwZjLZ5d9Ue'
		request.body = "{\"ShortCode\":\"ShortCode\",
    		\"ResponseType\":\"ResponseType\",
    		\"ConfirmationURL\":\"http://ip_address:port/confirmation\",
    		\"ValidationURL\":\"http://ip_address:port/validation_url\"}"

  		response = Net::HTTP.new(uri.host,uri.port) do |http|
  			http.request(request)
		end

		json_response(request.body)
	end
end
