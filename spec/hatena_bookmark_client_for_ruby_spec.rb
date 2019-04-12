RSpec.describe HatenaBookmarkClientForRuby do
  it "has a version number" do
    expect(HatenaBookmarkClientForRuby::VERSION).not_to be nil
  end

  it "greet test" do
    expect(HatenaBookmarkClientForRuby.greet).to eq("Hello")
  end
end
