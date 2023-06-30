require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let(:user) { User.create(name: 'Sam') }
  subject do
    Recipe.new(name: 'Nigria jollof', preparation_time: 1.0, cooking_time: 2.0, public: true, user_id: user.id,
               description: 'This is how to create Nigeria jollof')
  end

  context 'Testing validations' do
    it 'should be invalid with name set to nill value' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it "should be invalid with public value set to 'ben' " do
      subject.public = 'no'
      expect(subject).to_not be_valid
    end

    it 'should be invalid with preparation_time value less than or equal to 0 ' do
      subject.preparation_time = 0
      expect(subject).to_not be_valid

      subject.preparation_time = -5
      expect(subject).to_not be_valid
    end

    it 'should be invalid with cooking_time value less than or equal to 0' do
      subject.cooking_time = 0
      expect(subject).to_not be_valid

      subject.cooking_time = -1
      expect(subject).to_not be_valid
    end
  end
end
