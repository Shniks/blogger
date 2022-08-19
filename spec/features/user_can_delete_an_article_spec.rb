require 'rails_helper'

RSpec.describe 'When a user clicks on delete button on an article' do
  it 'deletes that article' do
    article_1 = Article.create!(title: "Title 1", body: "Body 1")
    article_2 = Article.create!(title: "Title 2", body: "Body 2")

    visit '/articles'

    within ".article-#{article_1.id}" do
      click_button 'Delete'
    end

    expect(current_path).to eq('/articles')
    expect(page).to have_content('Title 2')
  end
end
