require './article'

describe Article do
  # before do
  #   @article_blank = Article.new 
  #   @article_full = Article.new title: "Big News", body: "You won't believe this one simple trick to escape tax liability in 45 states", author: "Shady McGee"
  # end
  let(:article_blank) { Article.new }
  let(:article_full) do 
    Article.new title: "Big News", body: "You won't believe this one simple trick to escape tax liability in 45 states", author: "Shady McGee"
  end

  it "creates a #new article" do
    expect(article_full).to be_instance_of(Article)
  end

  context "empty article" do
    it "returns false on #title?" do
      expect(article_blank.title?).to eq(false)
    end
    it "returns false on #body?" do
      expect(article_blank.body?).to eq(false)
    end
  end

  context "populated article" do
    it "confirms #title? is set" do
      expect(article_full.title?).to eq(true)
    end
    it "confirms #body? is set" do
      expect(article_full.body?).to eq(true)
    end
  end
end



