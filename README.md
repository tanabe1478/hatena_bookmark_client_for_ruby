# HatenaBookmarkClient

`HatenaBookmarkClient` is simple Ruby networking library for Hatena bookmark Web API

## Installation


```sh
gem  install hatena_ebookmark_client_for_ruby
```

## Example

```ruby
require 'hatena_bookmark_client_for_ruby'
 hatebu = HatenaBookmarkClient::Bookmark.new(
      consumer_key: CONSUMER_KEY,
      consumer_secret: CONSUMER_SECRET,
      request_token: REQUEST_TOKEN,
      request_secret: REQUEST_SECRET,
    )
body = {
      url: "http://developer.hatena.ne.jp/ja/documents/bookmark/apis/rest/bookmark#post_my_bookmark",
      comment: "test",
    }
response = hatebu.create(body)
puts response.body
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/hatena_bookmark_client_for_ruby.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
