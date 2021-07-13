Feature: Manage Playlists
  In order to make a Song
  As an iscritto
  I create Playlists and User
	
  	Scenario: Add a song
			Given I am on the OrangeLyrics home page
			When I follow "Add New Song"
			Then I should be on the Create New Song page
			Given Playlist "TEST_PLAYLIST" with Content "TEST_CONTENT" by User "TEST_USER" is there
			Given User "TEST_USER" with Encrypted Password "TEST_PASSWORD" with Reset Password Token "TEST_RESET" with Role Mask  "TEST_ROLEMASK" is there
			Given Song "Blowin' in the wind" with Artist "TEST_ARTIST" and Year "1900" and Genre  "TEST_GENRE" and Lyric "TEST_LYRICS"  for Playlist "TEST_PLAYLIST" by User "TEST_USER" is there
			Then I should be on the OrangeLyrics home page
		
			
			
  	
	


  		