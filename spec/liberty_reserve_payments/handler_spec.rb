require 'spec_helper'

describe LibertyReservePayments::Handler do
  let :attributes do
    {account_number: 'U123456', store_name: 'MyStore', security_word: 'MySecWord123'}
  end

  let :instance do
    LibertyReservePayments::Handler.new attributes
  end
  describe '.valid?' do
    let :params do
      {
          lr_paidto: 'U123456',
          lr_paidby: 'U789',
          lr_store: 'MyStore',
          lr_amnt: '12.34',
          lr_transfer: '4456778335534',
          lr_currency: 'LRUSD',
          lr_encrypted: 'E71A1EE0A1396EDB03FD24BE88C129CFE3DFFC8A05188084FB853305978080FB'
      }
    end
    it 'should be a valid response' do
      instance.valid?(params).should be_true
    end
  end
end