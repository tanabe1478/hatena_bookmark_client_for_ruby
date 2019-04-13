RSpec.describe HatenaBookmarkClientForRuby do
  before do
    @hatebu = HatenaBookmarkClientForRuby::Bookmark.new(
      consumer_key: "",
      consumer_secret: "",
      request_token: "",
      request_secret: "",
    )
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
end
