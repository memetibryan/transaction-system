class MpesasController < ApplicationController
	#index controller for index viewer
	def index
	end

	def show
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
		request["authorization"] = 'Bearer hyMqDyAd6fwFbTyWdLzsndc7jd1ecYjG'
		request.body = "{ \"ShortCode\":\" \",
  			\"CommandID\":\"CustomerPayBillOnline\",
  			\"Amount\":\" \",
  			\"Msisdn\":\" \",
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
      @user = current_user
      @mpesa = @user.mpesas.new(mpesa_params)
    if @mpesa.save
      redirect_to mpesas_path(@user)
    else
      render :new
    end
    end

    private
    def mpesa_params
      params.require(:profile).permit(:access_token, :customer_paybill, :amount, :bill_refnumber)
    end
end
