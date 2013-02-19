require 'digest'
module LibertyReservePayments
  class Handler < Base
    attr_required :account_number, :store_name, :security_word

    ENDPOINT = 'https://sci.libertyreserve.com'

    def initialize(attributes = {})
      super
    end

    def payment_request_uri(amount, currency, order_id, item_name)
      endpoint = URI.parse ENDPOINT
      @query = {lr_acc: self.account_number, lr_store: self.store_name, lr_amnt: amount,
                        lr_currency: currency, lr_merchant_ref: order_id,
                        item_name: item_name, order_id: order_id}
      endpoint.query = @query.to_query
      endpoint.to_s
    end

    def valid?(params)
      sha256 = Digest::SHA256.new
      str = "#{params[:lr_paidto]}:#{params[:lr_paidby]}:#{params[:lr_store].gsub(/\\\//, '')}:#{params[:lr_amnt]}:#{params[:lr_transfer]}:#{params[:lr_currency]}:#{self.security_word}"
      first_hash = sha256.digest(str)
      second_hash = first_hash.unpack('H*').first.upcase
      if params[:lr_encrypted] == second_hash and params[:lr_paidto] == self.account_number
        true
      else
        false
      end
    end
  end
end
