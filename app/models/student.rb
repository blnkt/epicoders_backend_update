class Student < ActiveRecord::Base
  before_save :parse_github

private
  def parse_github
    data = JSON.parse(RestClient.get "https://api.github.com/users/#{self.github_username}")
    self.email = data["email"]
    self.avatar = data["avatar_url"]
    self.current_location = data["location"]
    self.hireable = data["hireable"]
    self.bio = data["bio"]
    self.html_url = data["html_url"]
  end
end
