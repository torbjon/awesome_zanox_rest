require 'spec_helper'

describe AwesomeZanox::InstanceResource do
  it 'should return auth hash' do
    instance_resource = AwesomeZanox::InstanceResource.new('802B8BF4AE99EBE00F41', 'fa4c0c2020Aa4c+ab9Ea0ec8d39E06/df2c5aa44')

    date  = 'Thu, 15 Aug 2013 15:56:07 GMT'
    nonce = '17811FEFBA7448CE848327F835729AA2'
    signature = instance_resource.auth_signature(
      '/reports/sales/date/2013-07-20', 'GET', date, nonce
    )

    expect(signature).to eq(
      'Authorization' => 'ZXWS 802B8BF4AE99EBE00F41:N4RPYDY1aUjciVm32pCJ82FVvuk=', 'Date' => date, 'nonce' => nonce
    )
  end
end
