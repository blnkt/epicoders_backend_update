require 'rails_helper'

describe Student do
  it { should validate_presence_of :name }
  it { should validate_presence_of :season }
  it { should validate_presence_of :year }
  it { should validate_presence_of :github_username }
end
