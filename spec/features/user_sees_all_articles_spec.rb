require 'rails_helper'

RSpec.describe 'When a user visits the articles index page' do
  it 'they see all the articles' do
    article_1 = Article.create!(title: "Title 1", body: "Body 1")
    article_2 = Article.create!(title: "Title 2", body: "Body 2")

    visit '/articles'

    expect(page).to have_content(article_1.title)
    expect(page).to have_link(article_1.title)
    expect(page).to have_content(article_2.title)
    expect(page).to have_link(article_2.title)
  end
end
