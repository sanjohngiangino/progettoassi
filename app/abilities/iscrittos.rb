Canard::Abilities.for(:iscritto) do
    can [:create], Song
    cannot [:destroy, :update], Song
    can [:create], Playlist
    cannot [:destroy, :update], Playlist
  end
  