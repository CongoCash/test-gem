class IndexController < ApplicationController

  def main
    # 'http://rubygems.org/api/v1/versions/httparty.json'
    response = HTTParty.get('https://slickdeals.net/deals/tv')
    @parse_page = Nokogiri::HTML(response.body)
    @popular_urls = []
    @parse_page.css('.itemTitle').each do |link|
      @popular_urls.push(link.values[0])
    end
    fail
    # Pry.start(binding)
  end

end

# Notes:
# 1.  Put 'gem httparty' and 'gem nokogiri' in your gemfile
# 2.  bundle install in the rails console
# 3.  In your controller, use HTTParty.get('your URL that you want to use') and set it to
#     to a variable.  This will return HTML in an array form.
# 4.  Use Nokogiri::HTML('HTTParty variable') in order to make the HTML parsable.
# 5.  Now you can look through the HTML code and find css selectors and target
#     data that you want.