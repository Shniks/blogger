require 'rails_helper'

RSpec.describe 'When a user visits the articles index' do
  describe 'and clicks on an article title' do
    it 'takes them to the show page for that article' do
      article_1 = Article.create!(title: "Title 1", body: "Body 1")
      article_2 = Article.create!(title: "Title 2", body: "Body 2")
      comment_1 = article_1.comments.create(author_name: "Me", body: "Commenty comments")
      comment_2 = article_1.comments.create(author_name: "You", body: "So much to say")

      visit articles_path

      within ".article-#{article_1.id}" do
        click_on article_1.title
      end

      expect(current_path).to eq("/articles/#{article_1.id}")
      expect(page).to have_content(article_1.title)
      expect(page).to have_content(article_1.body)
      expect(page).to_not have_content(article_2.title)

      visit articles_path

      within ".article-#{article_2.id}" do
        click_on article_2.title
      end

      expect(current_path).to eq("/articles/#{article_2.id}")
      expect(page).to have_content(article_2.title)
      expect(page).to have_content(article_2.body)
      expect(page).to_not have_content(article_1.title)
      expect(page).to have_content(comment_1.author_name)
      expect(page).to have_content(comment_2.author_name)
      expect(page).to have_content(comment_1.body)
      expect(page).to have_content(comment_2.body)
    end
  end
end
