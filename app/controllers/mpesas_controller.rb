class MpesasController < ApplicationController

	def index
		@user = current_user
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
		#access token
		request["authorization"] = 'Bearer hyMqDyAd6fwFbTyWdLzsndc7jd1ecYjG '
		request.body = "{ \"ShortCode\":\"600000 \",
  			\"CommandID\":\"CustomerPayBillOnline\",
  			\"Amount\":\"1000\",
  			\"Msisdn\":\" 254708374149\",
  			\"BillRefNumber\":\" \" }"

		response = http.request(request)

		#displays results of the get request
		json_response(response.read_body)
	end

	def new
		@user = current_user
        @mpesas = Mpesa.new
	end

	def create
		@mpesas = Mpesa.new
        @mpesa = Mpesa.new(mpesa_params)
    if @mpesa.save
        #redirect_to mpesas_path(current_user)
        redirect_to "/mpesas"
    else
      render :new
    end
    end

    private
    def mpesa_params
      params.require(:mpesa).permit(:access_token, :customer_paybill, :amount, :bill_refnumber, :user_id)
    end
end
