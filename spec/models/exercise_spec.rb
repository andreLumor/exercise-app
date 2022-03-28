require 'rails_helper'

RSpec.describe Exercise, type: :model do
  context 'associations' do
    it { should have_and_belong_to_many(:routines) }
  end

  describe 'validations' do
    it { should validate_presence_of(:description) }

    it { should validate_presence_of(:intensity) }
    it { should validate_numericality_of(:intensity).is_less_than_or_equal_to(10) }
    it { should validate_numericality_of(:intensity).is_greater_than_or_equal_to(0) }
  end
end
