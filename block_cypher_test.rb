require_relative 'block_cypher'
require './block_cypher'
require 'test/unit'
require 'digest'
require 'blockcypher'
require 'open-uri'
require 'json'
class TestBlockCypher < Test::Unit::TestCase
    def setup
        @blockCypherCurrency = BlockCypherCurrency.new 
       
        @url_faucets_transactions = "http://api.blockcypher.com/v1/bcy/test/txs/"
    end

    def test_transaction
        transaction_ref = @blockCypherCurrency.bcy_crypto_currency()
        if transaction_ref 
            end_point = @url_faucets_transactions + String.try_convert(@blockCypherCurrency.transaction)
            content = open(end_point).read
            content_json = JSON.parse(content)
            output = content_json['outputs'][0]
            value = output['value']
            assert_equal(20000000, value)
        else
            assert_equal(transaction_ref, false,"Error na transacao")
        end                
    end
end
