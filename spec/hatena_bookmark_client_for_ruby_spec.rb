require "json"

RSpec.describe HatenaBookmarkClientForRuby do
  before do
    @hatebu = HatenaBookmarkClientForRuby::Bookmark.new(
      consumer_key: "",
      consumer_secret: "",
      request_token: "",
      request_secret: "",
    )
    @entry = HatenaBookmarkClientForRuby::Entry.new("http://www.hatena.ne.jp/")
    @count = HatenaBookmarkClientForRuby::BookmarkCount.new(["http://www.hatena.ne.jp/", "http://b.hatena.ne.jp/"])
  end
  it "has a version number" do
    expect(HatenaBookmarkClientForRuby::VERSION).not_to be nil
  end

  it "create new bookmark" do
    hash = {
      url: "http://developer.hatena.ne.jp/ja/documents/bookmark/apis/rest/bookmark#post_my_bookmark",
      comment: "test",
    }
    mock = double("hatena bookmark client")
    expect allow(mock).to receive(:create)
    allow(@hatebu).to receive(:create).and_return(mock)
    expect { @hatebu.create(hash) }.not_to raise_error
  end

  it "get bookmarked entry info" do
    #JSON.parse(@entry.get_withou_relations.body)
  end

  it "get bookmark count" do
    JSON.parse(@count.get.body)
  end
end
