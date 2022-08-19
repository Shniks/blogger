require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'validations' do
    it { should validate_presence_of :author_name }
    it { should validate_presence_of :body }
  end

  describe 'relationships' do
    it { should belong_to :article }
  end
end 
