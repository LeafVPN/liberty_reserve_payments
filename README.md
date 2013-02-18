# LibertyReservePayments

Receive payments via Liberty Reserve. With this gem the user of your shop
can pay for a digital item (or any type of item) and validate the transaction
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

After

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
