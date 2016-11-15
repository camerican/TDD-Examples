class Article

  attr_accessor :title, :body, :author

  def initialize(options = {})
    @title = options[:title]
    @body = options[:body]
    @author = options[:author]
  end

  def title?
    !string_empty? title
  end

  def body?
    !string_empty? body
  end

  def string_empty?(string)
    string.nil? || string == ""
  end

  def authors_name_starts_with_q?
    @author[0].downcase == "q"
  end

  def article_as_html
    title_as_html + author_as_html + body_as_html
  end

  def title_as_html
    "<h1>#{title}</h1>"
  end

  def author_as_html
    "<b>#{author}</b>"
  end

  def body_as_html
    body.split("\n").map{|paragraph| "<p>#{paragraph}</p>"}.join("")
  end

end