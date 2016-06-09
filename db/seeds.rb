# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or create!d alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create!([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create!(name: 'Emanuel', city: cities.first)
#
image = File.open(File.join(Rails.root, "spec/support/images/landscape_image.jpg"))

puts "Creating Admin"
Optimadmin::Administrator.create!(
  username: 'optimised', email: 'support@optimised.today',
  password: 'optipoipoip', password_confirmation: 'optipoipoip', role: 'master')

puts "Creating pages"
page = Page.create!(title: "page 1", image: image, content: "Content", style: "basic", layout: "application")

puts "Creating main navigation"
wellbeing_zone = Optimadmin::ModulePage.create!(name: "WellBeing Zone", route: "wellbeing_path")
wellbeing_zone_link = Optimadmin::Link.create!(menu_resource: wellbeing_zone)
wellbeing_menu_item = Optimadmin::MenuItem.create!(link: wellbeing_zone_link, name: "Wellbeing Zone", menu_name: "header")
page_link = Optimadmin::Link.create!(menu_resource: page)
page_menu_item = Optimadmin::MenuItem.create!(link: page_link, name: "Page", menu_name: "header")

puts "Creating health zones"
HealthZone.create!(title: "Know your body", home_image: image, hover_text: "Visit our know your body section", link: "http://www.google.co.uk")
HealthZone.create!(title: "Feeling Fab exercises", home_image: image, hover_text: "Visit our exercises section", link: "http://www.google.com")
HealthZone.create!(title: "Managing Conditions", home_image: image, hover_text: "Learn how to manage your conditions", link: "http://www.bbc.co.uk")
HealthZone.create!(title: "Other", home_image: image, hover_text: "Learn how to manage your conditions", link: "http://www.bbc.co.uk/sport")

puts "creating videos" #used in additional home content and in wellbeing zone
video = Video.create!(title: "Ain't no sunshine", youtube_identifier: "tIdIqbv7SPo",
                     subtitle: "Some subtitle", content: "Some content")
video = Video.create!(title: "Ain't no sunshine", youtube_identifier: "tIdIqbv7SPo")

puts "creating additional home content"
text_content = <<-RUBY
  <ul>
    <li>We prevent people going off work</li>
    <li>Getting people back to work</li>
    <li>Keeping people fit and well</li>
  </ul>
RUBY
AdditionalHomeContent.create!(title: "What we do", content_type: "text_content", content: text_content)
AdditionalHomeContent.create!(title: "b", video: video, content_type: "video_content")
AdditionalHomeContent.create!(title: "ROI Savings Calculator", content_type: "savings_calculator")

puts "Creating banners"
Banner.create!(title: "Banner", image: image)
Banner.create!(title: "Banner with summary", image: image, summary: "Summary text")
Banner.create!(title: "Banner with link", image: image, link: "http://www.google.co.uk")

puts "Creating Quick Links"
8.times do
  EmployerQuickLink.create!(link: "http://www.google.co.uk", link_text: "Read more")
  EmployeeQuickLink.create!(link: "http://www.google.co.uk", link_text: "Read more")
end

puts "Creating service standards"
ServiceStandard.create!(icon: "clock", content: "Patients receive personal attention within four hours", hover_content: "We provide a single point of contact for the provision of physiotherapy care")
ServiceStandard.create!(icon: "calendar", content: "Guaranteed treatment within three days", hover_content: "Much quicker than the national average of 12 weeks")
ServiceStandard.create!(icon: "map_pin", content: "Easy to access clinics within 30 minutes travelling", hover_content: "700 clinics and 2,500 chartered physiotherapists nationwide")
ServiceStandard.create!(icon: "flexible", content: "Flexible treatment options to suit each patient",hover_content: "Hands on treatment, support and condition management")
ServiceStandard.create!(icon: "document", content: "High quality patient support resources", hover_content: "Online patient treatment centre.  Narrated videos for specific injuries.  Illustrated exercise guides")
ServiceStandard.create!(icon: "stopwatch", content: "Fast and safe patient recovery time", hover_content: "On average patients are fit to return to work in ten days")
ServiceStandard.create!(icon: "heart", content: "Post injury care", hover_content: "After care health and wellbeing support includes access to educational and exercise material")

puts "Creating practices"
Practice.create!(name: "Hull", post_code: "HU1 1NQ")

puts "Creating clients"
client = Client.create!(name: "Client 1", logo: image, display: true)
Client.create!(name: "Client 2", logo: image, display: true)

puts "Creating case studies"
CaseStudy.create!(title: "Case Study #1", image: image, summary: "Some content", content: "Some more content", display: true, date: Date.yesterday) 
CaseStudy.create!(title: "Case Study #2", summary: "A longer summary... let's shorten me because I am going to be way too long blah blah blah blah blah blah", content: "Some content", display: true, date: Date.today)

puts "Creating testimonials"
Testimonial.create!(title: "My title", content: "Some content", author: "John Simms")
Testimonial.create!(title: "Testimonial 2", content: "Some content", author: "Beth Norman")

puts "Creating team members"
team_member = TeamMember.create!(forename: "Joe", surname: "Bloggs", image: image, bio: "Biography", email: "joe.bloggs@example.com", phone: "01234 567890", role: "Some role")
8.times do
  TeamMember.create!(forename: "Jane", surname: "Bloggs", image: image, bio: "Biography", email: "jane.bloggs@example.com", phone: "01234 567890", role: "Some role")
end
TeamMember.create!(forename: "Jane", surname: "Has no image", bio: "Biography", email: "jane.bloggs@example.com", phone: "01234 567890", role: "Some role")
  
puts "Creating articles"
Article.create!(title: "Article 1", image: image, summary: "Summary", content: "Content", date: Date.today, author: team_member)
Article.create!(title: "Article 2", summary: "Summary", content: "Content", date: Date.today)
Article.create!(title: "Article 3", summary: "Summary", content: "Content", date: Date.today)
Article.create!(title: "Article 4", summary: "Summary", content: "Content", date: Date.today)

puts "Creating body parts"
body_parts = []
BodyPart::BODY_PARTS.each_with_index do |name, i|
  body_parts << if i % 2 == 0
    BodyPart.create!(name: name, tagline: "Some tagline")
  else
    BodyPart.create!(name: name)
  end
end

BodyPartSection.create!(title: "Some title", sub_title: "Some subtitle",
                        content: "blah", body_part: body_parts.first)
BodyPartSection.create!(title: "Some title", image: image,
                        content: "blah", body_part: body_parts.first)

puts "Creating FAQs"
6.times do
  FrequentlyAskedQuestion.create!(question: "Really?", answer: "Sure")
end

puts "Creating people helped sections"
PeopleHelpedSection::SECTIONS.each do |section|
  PeopleHelpedSection.create!(section: section, title: "Some title", number: 7,
                              content: "some content", link: "http://www.google.co.uk")
end

image.close
