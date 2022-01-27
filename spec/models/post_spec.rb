require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'post validation tests' do

    subject do 
      ali = User.new(name: "Ali Abbani", photo: "home photo", bio: "ali's bio", posts_counter: 0)
      Post.new(title: "good title", text: "texttexttext", comments_counter: 2, likes_counter: 2, author_id: ali.id) 
    end

    before { subject.save }

    it 'title should be present' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'title should not be too long' do
      subject.title = 'ab' * 200
      expect(subject).to_not be_valid
    end

    it 'comments counter should be integer' do
      subject.comments_counter = 3.5
      expect(subject).to_not be_valid
    end

    it 'comments counter should be greater or equal 0' do
      subject.comments_counter = -1
      expect(subject).to_not be_valid
    end

    it 'likes counter should be greater or equal 0' do
      subject.likes_counter = -1
      expect(subject).to_not be_valid
    end
  end
end
