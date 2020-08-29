class MpesasController < ApplicationController
	
	def index
  
		@user = current_user

		  require 'net/http'
  		require 'net/https'
  		require 'uri'
  
  		url = URI('https://sandbox.safaricom.co.ke/mpesa/stkpush/v1/processrequest')
  
  		http = Net::HTTP.new(url.host, url.port)
  		http.use_ssl = true
  		http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  
  		request = Net::HTTP::Post.new(url)
  		request["accept"] = 'application/json'
  		request["content-type"] = 'application/json'		

		#access token
		request["authorization"] = 'Bearer Wb1uxhLQWeNCRCps24OFRIQJnUjw'
		request.body = "{

        BusinessShortCode: \"174379\",
        Password: \"MTc0Mzc5YmZiMjc5ZjlhYTliZGJjZjE1OGU5N2RkNzFhNDY3Y2QyZTBjODkzMDU5YjEwZjc4ZTZiNzJhZGExZWQyYzkxOTIwMTgxMDE1MTIzNTIw\",
        Timestamp: \"20181015123520\",
        TransactionType: \"CustomerPayBillOnline\",
        Amount: \"500\",
        PartyA: \"254704830480\",
        PartyB: \"174379\",
        PhoneNumber: \"254704830480\",
        CallBackURL: \"https://28d07e1ecc94.ngrok.io/hooks/mpesa\",
        AccountReference: \"Test\",
        TransactionDesc: \"BriemeINC\"
      }"

		response = http.request(request)

    #displays results of the get request
		puts response
    console.log(MerchantRequestID)
		
	end

	# def new
	# 	@user = current_user
 #        @mpesas = Mpesa.new
	# end

	# def create
	# 	@mpesas = Mpesa.new
 #        @mpesa = Mpesa.new(mpesa_params)
 #    if @mpesa.save
 #        #redirect_to mpesas_path(current_user)
 #        redirect_to "/mpesas"
 #    else
 #      render :new
 #    end
 #    end

 #    private
 #    def mpesa_params
 #      params.require(:mpesa).permit(:access_token, :customer_paybill, :amount, :bill_refnumber, :user_id)
 #    end
end
