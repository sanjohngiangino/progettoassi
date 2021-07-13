Canard::Abilities.for(:editor) do
  can [:destroy, :update,:create], Song
  can  [:destroy, :update,:create] , Playlist
end
