# LibertyReservePayments

Receive payments via Liberty Reserve. With this gem the user of your shop
can pay for a digital item (or any type of item) and you can validate the transaction
after it was made.

## Installation

Add this line to your application's Gemfile:

    gem 'liberty_reserve_payments'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install liberty_reserve_payments

## Usage

After the installation, you still need two files for the gem to work. A Yaml config file and an initializer.

### config/liberty.yml
```yaml
development:
  account_number: U1234567
  store_name: SampleStore
  security_word: test1234

production:
  account_number: U1234567
  store_name: SampleStore
  security_word: test1234
```

### config/initializers/liberty.rb
```ruby
require 'liberty_reserve_payments/handler'

LIBERTY_CONFIG = YAML.load_file("#{Rails.root}/config/liberty.yml")[Rails.env].symbolize_keys
```

After creating these files you still need to add the methods provided by this gem to your PaymentsController.
To do this you can add the following template methods to you file:

```ruby
def pay_item_with_lr
    handler = LibertyReservePayments::Handler.new LIBERTY_CONFIG
    @item = Item.find(params[:id])
    # The payment_request_uri takes the following arguments:
    # amount, currency = 'LRUSD', comments = '', order_id = '', item_name = ''
    # item_name and order_id are baggage fields that should aid you on the validation of the transaction
    # The method will generate a URL containing the parameters for the payment and redirect to the
    # Liberty Reserve website
    redirect_to handler.payment_request_uri(amount: @item.amount, order_id: '1', comment: 'Test Liberty')
end
```
You should also add a route for Liberty Reserve to send the status of the transactions. It can point to a method
looking like this:

```ruby
def validate_payment
    handler = LibertyReservePayments::Handler.new LIBERTY_CONFIG
    if handler.valid?(params)
        # The transaction has been validated. You can perform your own
        # validations now. You should specifically validate the amount that was paid.
    else
        # The transaction has been tampered with, you should log it for
        # later verification.
    end
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
