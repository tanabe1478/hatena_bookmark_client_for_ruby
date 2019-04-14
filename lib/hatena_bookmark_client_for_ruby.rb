require "hatena_bookmark_client_for_ruby/version"
require "oauth"
require "crack"

module HatenaBookmarkClientForRuby
  class Bookmark
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
      @access_token.post("http://api.b.hatena.ne.jp/1/my/bookmark", params)
    end

    def delete(url)
      encoded_url = CGI::escape(url)
      @access_token.delete("http://api.b.hatena.ne.jp/1/my/bookmark?url=#{url}")
    end

    def get(url)
      encoded_url = CGI::escape(url)
      @access_token.get("http://api.b.hatena.ne.jp/1/my/bookmark?url=#{url}")
    end

    def user_tags()
      @access_token.get("http://api.b.hatena.ne.jp/1/my/tags")
    end

    def entry(url)
      encoded_url = CGI::escape(url)
      @access_token.get("http://api.b.hatena.ne.jp/1/entry?url=#{encoded_url}")
    end

    def user()
      @access_token.get("http://api.b.hatena.ne.jp/1/my")
    end
  end

  class Error < StandardError
  end

  # Your code goes here...
end
