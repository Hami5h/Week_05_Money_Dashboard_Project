require_relative( '../models/merchant.rb' )
require_relative( '../models/tag.rb' )
require_relative( '../models/transaction.rb' )

merchant1 = Merchant.new({
  'name' => "Tesco",
})

merchant2 = Merchant.new({
  'name' => "Aldi",
})

tag1 = Tag.new({
  'name' => "Coffee",
})

tag2 = Tag.new({
  'name' => "Tea",
})

tag3 = Tag.new({
  'name' => "Sugar",
})

transaction1 = Transacation.new({
  'amount' => "140",
  'merchant_id' => "merchant1.id"
  'tag-id' => "tag1_id"
})

transaction2 = Transacation.new({
  'amount' => "125",
  'merchant_id' => "merchant2.id"
  'tag-id' => "tag2_id"
})

transaction3 = Transacation.new({
  'amount' => "80",
  'merchant_id' => "merchant1.id"
  'tag-id' => "tag3_id"
})

merchant1.save()
merchant2.save()
tag1.save()
tag2.save()
tag3.save()
transaction1.save()
transaction2.save()
transaction3.save()
