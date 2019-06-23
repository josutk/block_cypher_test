require 'blockcypher'
require 'json'
require 'open-uri'
class BlockCypherCurrency

    MY_TOKEN = "f559581fbebb412b9379cd5752bcae49" 

    RECEIVE_WALLET ="C3qXd3YYRBrZZod5D9GLGhpDNnVfAwpbe2" 

    CRYPTO_CURRENCY_VALUE = 20000000
    def transaction
        @transaction
    end
    def bcy_crypto_currency()
        bc_test = BlockCypher::Api.new(currency:BlockCypher::BCY, network:BlockCypher::TEST_NET, api_token:MY_TOKEN)

        u = bc_test.address_generate
        puts u
	    result =  bc_test.faucet(RECEIVE_WALLET, CRYPTO_CURRENCY_VALUE)
	    if result["tx_ref"]
		    @transaction = result["tx_ref"].to_s
		    return true
	    else
		    return false
        
        end 
    end
end
