class HomeController < ApplicationController
  def Index
    require 'net/http'
    require 'json'
    
    @url = 'https://api.coinmarketcap.com/v1/ticker/?limit=1000'
    @uri = URI(@url)
    @resonse = Net::HTTP.get(@uri)
    @coins = JSON.parse(@resonse)
        
    end
  
  def lookup
    require 'net/http'
    require 'json'    
    @url = 'https://api.coinmarketcap.com/v1/ticker/'
    @uri = URI(@url)
    @resonse = Net::HTTP.get(@uri)
    @lookup_coins = JSON.parse(@resonse)
    
    
    @symbol = params[:sym]
if @symbol
	@symbol = @symbol.upcase
    end
   if @symbol == ""
	@symbol = "Hey You Forgot to Enter a Currency!"
   end
  end
end
