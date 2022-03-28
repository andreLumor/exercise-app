require 'rails_helper'

RSpec.describe Routine, type: :model do
  context 'associations' do
    it { should have_and_belong_to_many(:exercises) }
  end

  context 'validations' do
    it { should validate_presence_of(:name) }
  end
end
