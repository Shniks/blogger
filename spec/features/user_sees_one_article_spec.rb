require "rails_helper"

describe 'User sees one article' do
  describe 'They link from the articles index' do
    it 'Displays information for one article' do

      article = Article.create!(title: 'New Title', body: 'New Body')
      visit articles_path
      click_link article.title

      expect(page).to have_content(article.title)
      expect(page).to have_content(article.body)
    end
  end
end
