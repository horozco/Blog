require "spec_helper.rb"

describe Comment do
  it { should belong_to (:post)}
  it { should have_many(:likes)}
  it { should validate_presence_of(:body)}
end