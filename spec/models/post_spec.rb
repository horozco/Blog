require "spec_helper"

describe Post do
  it {should belong_to(:user)}
  it {should validate_presence_of(:title)}
  it {should validate_presence_of(:content)}
  it {should validate_presence_of(:user_id)}
  it {should have_many(:comments)}
  it {should have_many(:user_comments)}
  it {should have_many(:anonymous_comments)}
end