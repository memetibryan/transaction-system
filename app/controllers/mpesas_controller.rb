class MpesasController < ApplicationController
	
	def index
		@user = current_user		
	end

	def new
		@user = current_user
        @mpesas = Mpesa.new
	end

	def create
		@mpesas = Mpesa.new

    require "uri"
    require "net/http"

    url = URI("https://sandbox.safaricom.co.ke/mpesa/stkpush/v1/processrequest")

    https = Net::HTTP.new(url.host, url.port);
    https.use_ssl = true

    request = Net::HTTP::Post.new(url)
    request["Authorization"] = "Bearer N2AbY9F59OKlGjJLtSm7edoVGY5w"
    request["Content-Type"] = "application/json"

    request.body = "{\n   
    \"BusinessShortCode\": \"174379\",\n    
    \"Password\": \"MTc0Mzc5YmZiMjc5ZjlhYTliZGJjZjE1OGU5N2RkNzFhNDY3Y2QyZTBjODkzMDU5YjEwZjc4ZTZiNzJhZGExZWQyYzkxOTIwMTgxMDE1MTIzNTIw\",\n   
    \"Timestamp\": \"20181015123520\",\n  
    \"TransactionType\": \"CustomerPayBillOnline\",\n   
    \"Amount\": \"1\",\n   
    \"PartyA\": \"254704830480\",\n  
    \"PartyB\": \"174379\",\n    
    \"PhoneNumber\": \"254704830480\",\n  
    \"CallBackURL\": \"https://28d07e1ecc94.ngrok.io/hooks/mpesa\",\n 
    \"AccountReference\": \"Test\",\n 
    \"TransactionDesc\": 
    \"BriemeINC\"\n}"

    response = https.request(request)
    puts response.read_body

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
