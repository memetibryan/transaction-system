class IndexController < ApplicationController
	def index
		require 'net/http'
require 'net/https'
require 'uri'

uri = URI('https://sandbox.safaricom.co.ke/mpesa/c2b/v1/simulate')

http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(uri)
request["accept"] = 'application/json'
request["content-type"] = 'application/json'
request["authorization"] = 'Bearer 9fAAXHt9Olgs0Lt62mYo0FVk5mFV'
request.body = "{ \"ShortCode\":\" \",
  \"CommandID\":\"CustomerPayBillOnline\",
  \"Amount\":\" \",
  \"Msisdn\":\" \",
  \"BillRefNumber\":\" \" }"

response = http.request(request)
puts response.read_body

		json_response(response.read_body)
	end
end