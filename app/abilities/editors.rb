Canard::Abilities.for(:editor) do
  can [:destroy, :update], Song
  cannot [:create], Song
  cannot [:create], Playlist
  can  [:destroy, :update] , Playlist
end
