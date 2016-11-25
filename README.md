[![Gem Version](https://badge.fury.io/rb/anetwork_dynamicad.svg)](https://badge.fury.io/rb/anetwork_dynamicad)
[![Total Downloads](http://ruby-gem-downloads-badge.herokuapp.com/anetwork_dynamicad)](https://rubygems.org/gems/anetwork_dynamicad)
[![Scrutinizer Code Quality](https://scrutinizer-ci.com/g/iamalirezaj/dynamicad/badges/quality-score.png?b=develop)](https://scrutinizer-ci.com/g/iamalirezaj/dynamicad/)
[![Join the chat at https://gitter.im/anetwork/dynamicad-php-client](https://badges.gitter.im/anetwork/dynamicad-php-client.svg)](https://gitter.im/anetwork/dynamicad-php-client?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

Hey, this is Anetwork Dynamicad Ruby client, if you want to test our REST API or want to use it as fast as possible this package is for you, with this package you can simply fetch your products, update them, delete them and finally manage your products logo. here is how we do it.

# Support

* Ruby: ^1.9

# Installation
Install anework dynamicad gem

```
gem install anetwork_dynamicad
```

## Usage : Set Config
You should set your API token before using the API Client:

```ruby
client = AnetworkDynamicAd::Client.new('YOUR-GENERATED-TOKEN')
```

# Manage products
You can manage your products in this part, you can insert, update, delete or get the products list in here.

# Get
This method returns your products list and let you limit the results.

```ruby
# return all products, limit them to 1000 items per request
client.product.get

# return product with id equals to 1
client.product.id(1).get

# return product which limited to 10 and offset 2
client.product.limit(10, 2).get
```

# Insert
Following Dynamicad structure you should post ```id```, ```title```, ```image``` and ```url``` as required fields:

```ruby
data = {
    id: 'abc',
    title: 'this is title',
    url: 'http://google.com',
    image: 'http://i.telegraph.co.uk/multimedia/archive/03589/Wellcome_Image_Awa_3589699k.jpg'
}

client.product.insert(data)
```

## troubleshooting

| Error | Descriptions | Solution |
| --- | --- | --- |
| 017 | Logo does not exist! | You should add new logo yo DynamicAd which explained in [this](https://github.com/iamalireza/dynamicad#insert-1) part.

# Update
You can also update your products with ```id```, ```title```, ```image``` and ```url``` as required fields:

```ruby
data = {
    id: 'abc',
    title: 'this is title',
    url: 'http://google.com',
    image: 'http://i.telegraph.co.uk/multimedia/archive/03589/Wellcome_Image_Awa_3589699k.jpg'
}

client.product.update(data)
```

# Delete
And you can simply delete your product with product ```id```:

```ruby
client.product.delete(1)
```

# Manage logos

You can manage your products logos in this part, you can insert, update, delete or get the logos list in here.

# Get
This method returns your products logos list and let you limit the results.

```ruby
# return all logos, limit them to 1000 items per request
Client.logo.get

# return logo with id equals to 1
Client.logo.id(1).get

# return logos which limited to 10 and offset 2
Client.logo.limit(10, 2).get
```

# Insert
You should post  ```image``` as required field:

```ruby
data = {
    image: 'http://i.telegraph.co.uk/multimedia/archive/03589/Wellcome_Image_Awa_3589699k.jpg',
    default: 1
}

client.logo.insert(data)
```

# Update
You can also update your products logo with ```id``` as required field:

```ruby
$data = {
    id: 'abc',
    default: 1,
    image: 'http://i.telegraph.co.uk/multimedia/archive/03589/Wellcome_Image_Awa_3589699k.jpg'
 }

client.logo.update(data)
```

# Delete
And you can simply delete your product logo with product ```id```:

```ruby
client.logo.delete(1)
```
