require 'rails_helper'

RSpec.describe 'When I click on a tag on an article show page' do
  it 'I get taken to the tag show page' do
    article = Article.create!(title: "New Title", body: "New Body")
    tag = article.tags.create!(name: "Name")

    visit article_path(article)

    click_link 'Name'

    expect(current_path).to eq(tag_path(tag))
    expect(page).to have_content(tag.name)
  end
end
