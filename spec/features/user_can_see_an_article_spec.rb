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
      expect(page).to have_content(comment_1.author_name)
      expect(page).to have_content(comment_2.author_name)
      expect(page).to have_content(comment_1.body)
      expect(page).to have_content(comment_2.body)

      visit articles_path

      within ".article-#{article_2.id}" do
        click_on article_2.title
      end

      expect(current_path).to eq("/articles/#{article_2.id}")
      expect(page).to have_content(article_2.title)
      expect(page).to have_content(article_2.body)
      expect(page).to_not have_content(article_1.title)
    end
  end

  describe 'they fill in a comment form' do
    it 'displays the comment in the article show' do
      article = Article.create!(title: "New Title", body: "New Body")

      visit article_path(article)

      fill_in :author_name, with: 'Lady Gaga'
      fill_in :body, with: 'So many thoughts about this article.'

      click_on 'Submit'

      expect(current_path).to eq(article_path(article))
      expect(page).to have_content('Post a Comment')
      expect(page).to have_content('Lady Gaga')
      expect(page).to have_content('So many thoughts about this article.')
    end
  end 
end
