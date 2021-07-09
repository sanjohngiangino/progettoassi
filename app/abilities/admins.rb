Canard::Abilities.for(:admin) do
  can [:create,:update,:destroy], Song
  can [:create,:update,:destroy], Playlist
end
