Given(/^I am on the home page$/) do
  visit "/"
end

Given(/^Song "(.*?)" with Artist "(.*?)" and Year "(.*?)" and Genre  "(.*?)" and Lyric "(.*?)"  for Playlist "(.*?)" by User "(.*?)" is there$/) do |arg1,arg2,arg3,arg4,arg5,arg6,arg7|
  rev = Playlist.find_by( name: arg6)
  use = User.find_by( id: arg7)
  s = Song.new( title: arg1, artist: arg2, year: arg3 , genre: arg4, lyric: arg5, playlist: rev, user: use)
  s.save
end

Given(/^Playlist "(.*?)" with Content "(.*?)" by User "(.*?)" is there$/) do |arg1,arg2,arg3|
	
	use = User.find_by( id: arg3)
  pla = Playlist.new(name: arg1,content: arg2, user: use)
  pla.save
end

Given(/^User "(.*?)" with Encrypted Password "(.*?)" with Reset Password Token "(.*?)" with Role Mask  "(.*?)" is there$/) do |arg1,arg2,arg3,arg4|
  u = User.new( email: arg1, encrypted_password: arg2, reset_password_token: arg3 , roles_mask: arg4)
  u.save
end

Then(/^I should see table heading "(.*?)"$/) do |arg1|
   expect(page).to have_selector("th", text:arg1)
end

Then(/^I should see Song "(.*?)" with Artist "(.*?)" and Year "(.*?)" and Genre  "(.*?)" and Lyric "(.*?)"  for Playlist "(.*?)" by User "(.*?)"$/) do |arg1,arg2,arg3,arg4,arg5,arg6,arg7|
	xpath_query = '//table/tr[td="'+arg1 +'" and td="'+arg2 +'" and td="'+arg3 +'" and td="'+arg5 +'" and td="'+arg6 +'" and td="'+arg7 +'"]'
	expect(page).to have_xpath(xpath_query)
end


Given('I am on the OrangeLyrics home page') do
  visit "/"
end

When('I follow {string}') do |string|
  get new_song_url
end

Then('I should be on the Create New Song page') do
  current_path = URI.parse(current_url).path
  current_path =='/songs/new'

end

When('I press {string}') do |string|
  click_link(string)
end

Then('I should be on the OrangeLyrics home page') do
  visit "/"
end




