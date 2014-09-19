class Student < ActiveRecord::Base
  before_save :bouncer
  before_save :parse_github
  before_save :scrape_github

  validates_presence_of :name
  validates_presence_of :season
  validates_presence_of :year
  validates_presence_of :github_username

private
  def bouncer
    list = ["Amoreena Hagedorn",
            "Amy Vaillancourt-Sals",
            "Andrew Akers",
            "Andrew Benavides",
            "Andrew Westling",
            "Anna Valkov",
            "Aoede Pando",
            "Austin Steward",
            "Blake Mason",
            "Brandon Madsen",
            "Carolyn Huynh",
            "Catherine Tran",
            "Christian Danielsen",
            "Cindy Ward",
            "Diane Douglas",
            "Diego Avalon",
            "Dustin Lewis",
            "Dylan Peerenboom",
            "Ellen Lehman",
            "Eric Johnson",
            "Erica Gordon",
            "Guy Halperin",
            "JJ Idt",
            "Jeff Stringer",
            "Jennifer McCarthy",
            "Jeremy Whitaker",
            "Josephine Wright",
            "Joshua Storey",
            "Justin Pacubas",
            "Justin Speers",
            "Katharine Chen",
            "Kyle Boe",
            "Kyle Smith",
            "Linda Gibson",
            "Marina Neumann",
            "Mark Rubenstein",
            "Matt Waechter",
            "Matthew Williams",
            "Meghan Lindsley",
            "Michael Derfler",
            "Moof Mayeda",
            "Nick Bernard",
            "Nuatu Tseggai",
            "Patrick David",
            "Peggy Condon",
            "Randy Leighton",
            "Ruben Rhodes",
            "Sanjeev Sekar",
            "Scott Dudley",
            "Sean Morrison",
            "Sean Niesen",
            "Sergii Mertsalov",
            "Sterling Houghton",
            "Tanner Steward",
            "William Kebler",
            "Xolani Mfuko"]
    if !list.index("#{self.name}")
      return false
    else
      return true
    end
  end

  def parse_github
    data = JSON.parse(RestClient.get "https://api.github.com/users/#{self.github_username}")
    self.email = data["email"]
    self.avatar = data["avatar_url"]
    self.current_location = data["location"]
    self.hireable = data["hireable"]
    self.bio = data["bio"]
    self.html_url = data["blog"]
  end

  def scrape_github
    data = RestClient.get "https://www.github.com/#{self.github_username}"
    num = data.index(/<h3>Popular repositories<\/h3>/)
    data = data.slice(num, 300)
    num = data.index(/<a href/)
    data = data.slice(num, 100)
    self.project = "https://www.github.com" + data.scan(/"([^"]*)"/).first.join
  end
end
