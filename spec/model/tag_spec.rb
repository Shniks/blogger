require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe 'relationships' do
    it { should have_many :taggings }
    it { should have_many(:articles).through(:taggings) }
  end
end 
