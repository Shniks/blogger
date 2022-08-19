require 'rails_helper'

RSpec.describe 'When a user clicks on edit next to an article in articles index' do
  describe 'they fill in a form and click update article' do
    it 'updates article' do
      article_1 = Article.create!(title: "Title 1", body: "Body 1")
      article_2 = Article.create!(title: "Title 2", body: "Body 2")

      visit '/articles'

      within ".article-#{article_1.id}" do
        click_link 'Edit'
      end

      expect(current_path).to eq('/articles/1/edit')

      fill_in :title, with: 'Edited Title'
      fill_in :body, with: 'Edited Body'

      click_on 'Update Article'

      expect(current_path).to eq('/articles/1')
      expect(page).to have_content('Edited Title')
      expect(page).to have_content('Edited Body')
    end
  end
end
