require "hatena_bookmark_client_for_ruby/version"
require "oauth"
require "crack"
require "net/http"

module HatenaBookmarkClientForRuby
  class BookmarkCount
    attr_accessor :urls

    def initialize(urls)
      @urls = urls
    end

    def get
      uri = URI.parse("http://api.b.st-hatena.com/entry.counts#{query_parameter}")
      response = Net::HTTP.get_response(uri)
    end

    private

    def query_parameter
      encoded_urls = urls.map { |url| CGI.escape(url) }
      "?url=#{encoded_urls.join("&url=")}"
    end
  end

  class Entry
    attr_accessor :url

    def initialize(url)
      @url = url
    end

    def get()
      encoded = URI.encode(url)
      uri = URI.parse("http://b.hatena.ne.jp/entry/json/#{url}")
      http = Net::HTTP.new(uri.host, uri.port)
      headers = { "content-Type" => "application/json" }
      http.get(uri.path, headers)
    end

    def get_withou_relations()
      encoded = URI.encode(url)
      uri = URI.parse("http://b.hatena.ne.jp/entry/jsonlite/#{url}")
      http = Net::HTTP.new(uri.host, uri.port)
      headers = { "content-Type" => "application/json" }
      http.get(uri.path, headers)
    end
  end

  class Bookmark
    attr_accessor :access_token

    def initialize(params)
      consumer = OAuth::Consumer.new(
        params[:consumer_key],
        params[:consumer_secret],
      )

      @access_token = OAuth::AccessToken.new(
        consumer,
        params[:request_token],
        params[:request_secret]
      )
    end

    def create(params)
      access_token.post("http://api.b.hatena.ne.jp/1/my/bookmark", params)
    end

    def delete(url)
      encoded_url = CGI::escape(url)
      access_token.delete("http://api.b.hatena.ne.jp/1/my/bookmark?url=#{url}")
    end

    def get(url)
      encoded_url = CGI::escape(url)
      access_token.get("http://api.b.hatena.ne.jp/1/my/bookmark?url=#{url}")
    end

    def user_tags()
      access_token.get("http://api.b.hatena.ne.jp/1/my/tags")
    end

    def entry(url)
      encoded_url = CGI::escape(url)
      access_token.get("http://api.b.hatena.ne.jp/1/entry?url=#{encoded_url}")
    end

    def user()
      access_token.get("http://api.b.hatena.ne.jp/1/my")
    end

    def search(id, query, of = 0, limit = 20)
      access_token.get("http://b.hatena.ne.jp/#{id}/search/json?q=#{query.encode("UTF-8")}&of=#{of}&limit=#{limit}")
    end
  end

  class Error < StandardError
  end

  # Your code goes here...
end
