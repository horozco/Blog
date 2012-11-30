require "spec_helper"

describe Like do
  it { should belong_to(:user)}
  it { should belong_to(:comment)}
  it { should validate_uniqueness_of(:comment_id)}
end