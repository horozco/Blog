require "spec_helper"

describe User do
	it { should validate_presence_of(:full_name)}
	it { should validate_uniqueness_of(:email)}
	it { should have_many(:posts)}
	it { should have_many(:likes)}
end