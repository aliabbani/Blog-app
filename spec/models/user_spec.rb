require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'user validation tests' do
    subject { User.new(name: "Ali Abbani", photo: "home photo", bio: "ali's bio", posts_counter: 0) }
    before { subject.save }

    it 'name should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'posts counter should be integer' do
      subject.posts_counter = 3
      expect(subject).to be_valid
    end

    it 'posts counter should be integer' do
      subject.posts_counter = 3.5
      expect(subject).to_not be_valid
    end

    it 'posts counter should be greater or equal 0' do
      subject.posts_counter = -1
      expect(subject).to_not be_valid
    end

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

  end
end