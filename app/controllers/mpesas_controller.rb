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
  
  		request = Net::HTTP::Get.new(url)
  		request["accept"] = 'application/json'
  		request["content-type"] = 'application/json'		

		#access token
		request["authorization"] = 'Bearer PdcXBlCXsDsG5Z7zqJEFm3AAOT5h'
		request.body = "{

      		BusinessShortCode: \"174379\",
      		Password: \"MTc0Mzc5YmZiMjc5ZjlhYTliZGJjZjE1OGU5N2RkNzFhNDY3Y2QyZTBjODkzMDU5YjEwZjc4ZTZiNzJhZGExZWQyYzkxOTIwMjAwODI5MDg0MTIw\",
      		Timestamp: \"20200829084120\",
      		TransactionType: \"CustomerPayBillOnline\",
      		Amount: \"100\",
      		PartyA: \"254704830480\",
      		PartyB: \"174379\",
      		PhoneNumber: \"254704830480\",
      		CallBackURL: \"localhost:3000/mpesas\";
      		AccountReference: \"Test\",
      		TransactionDesc: \"BriemeINC\"
      	    }"

		response = http.request(request)

    #displays results of the get request
		json_response(response.code) 
		
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
