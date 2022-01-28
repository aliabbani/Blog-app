require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'comment validation tests' do

    subject { comment = Comment.new(text: "creation of comment", author_id: 2, post_id: 2) }

    before { subject.save }

    it 'text should be present' do
      subject.text = nil
      expect(subject).to_not be_valid
    end

    it 'author_id should be integer' do
      subject.author_id = "ali"
      expect(subject).to_not be_valid
    end

    it 'author_id should be integer greater or equal 0 ' do
      subject.author_id = -2
      expect(subject).to_not be_valid
    end

    it 'post_id should be integer' do
      subject.post_id = "ali"
      expect(subject).to_not be_valid
    end

    it 'post_id should be integer greater or equal 0 ' do
      subject.post_id = -2
      expect(subject).to_not be_valid
    end
  end
end
