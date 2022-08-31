require 'rails_helper'

RSpec.describe 'When a user clicks on create new article in articles index' do
  describe 'they fill in a form and click create article' do
    it 'creates new article' do

      visit '/articles'

      click_link 'Create a New Article'

      expect(current_path).to eq('/articles/new')

      fill_in :title, with: 'New Title'
      fill_in :body, with: 'New Body'
      fill_in :tag_list, with: "ruby, technology"

      click_on 'Create Article'

      expect(current_path).to eq('/articles/1')
      expect(page).to have_content('New Title')
      expect(page).to have_content('New Body')
      expect(page).to have_content('ruby technology')
    end
  end
end
