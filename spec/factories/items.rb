FactoryBot.define do
  factory :item do
    image              { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.png')) }
    user               { User.new }
    item_name          { 'hoge' }
    item_discription   { 'hogehoge' }
    category_id        { '2' }
    condition_id       { '2' }
    shipping_charge_id { '2' }
    prefecture_id      { '2' }
    processing_time_id { '2' }
    price              { '1000' }
  end
end
