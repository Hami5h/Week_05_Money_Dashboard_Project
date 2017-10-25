require_relative( '../models/merchant.rb')
require_relative( '../models/tag.rb')
require_relative( '../models/transaction.rb')
require('pry-byebug')

Transaction.delete_all()

merchant1 = Merchant.new({
  'name' => "Tesco",
})
merchant1.save()

merchant2 = Merchant.new({
  'name' => "Aldi",
})
merchant2.save()

tag1 = Tag.new({
  'item_type' => "Electrical",
})
tag1.save()

tag2 = Tag.new({
  'item_type' => "Beauty",
})
tag2.save()

tag3 = Tag.new({
  'item_type' => "Food",
})
tag3.save()

tag4 = Tag.new({
  'item_type' => "Clothing",
  })
tag4.save()


transaction1 = Transaction.new({
  'amount' => 14,
  'item_name' => "Coffee",
  'merchant_id' => merchant1.id,
  'tag_id' => tag3.id,
})
transaction1.save()

transaction2 = Transaction.new({
  'amount' => 12,
  'item_name' => "Tea",
  'merchant_id' => merchant2.id,
  'tag_id' => tag3.id,
})
transaction2.save()

transaction3 = Transaction.new({
  'amount' => 3,
  'item_name' => "Sugar",
  'merchant_id' => merchant1.id,
  'tag_id' => tag3.id,
})
transaction3.save()

transaction4 = Transaction.new({
  'amount' => 180,
  'item_name' => "Jeans",
  'merchant_id' => merchant2.id,
  'tag_id' => tag4.id,
})
transaction4.save()

binding.pry
nil
