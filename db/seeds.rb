require_relative( '../models/merchant.rb' )
require_relative( '../models/tag.rb' )
require_relative( '../models/transaction.rb' )

merchant1 = Merchant.new({
  'name' => "Tesco",
})
merchant1.save()

merchant2 = Merchant.new({
  'name' => "Aldi",
})
merchant2.save()

tag1 = Tag.new({
  'name' => "Coffee",
  'type' => "Food",
})
tag1.save()

tag2 = Tag.new({
  'name' => "Tea",
  'type' => "Food",
})
tag2.save()

tag3 = Tag.new({
  'name' => "Sugar",
  'type' => "Food",
})
tag3.save()

tag4 = Tag.new({
  'name' => "Jeans",
  'type' => "Clothing",
  })
tag4.save()


transaction1 = Transacation.new({
  'amount' => 140,
  'merchant_id' => merchant1.id,
  'tag_id' => tag1.id,
})
transaction1.save()

transaction2 = Transacation.new({
  'amount' => 125,
  'merchant_id' => merchant2.id,
  'tag_id' => tag2.id,
})
transaction2.save()

transaction3 = Transacation.new({
  'amount' => 80,
  'merchant_id' => merchant1.id,
  'tag_id' => tag3.id,
})
transaction3.save()

transaction4 = Transacation.new({
  'amount' => 180,
  'merchant_id' => merchant2.id,
  'tag_id' => tag4.id,
})
transaction4.save()
