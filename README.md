/config/routes.rb

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :songs
end

cmd => rails routes -c songs

cmd => rails generate controller songs

cmd => rails generate model songs

//db/migrate

class CreateSongs < ActiveRecord::Migration[6.1]
  def change
    create_table :songs do |t|
      t.string 'title'
      t.string 'artist'
      t.string 'album'
      t.string 'genre'
      t.datetime 'release_date'
      t.timestamps
    end
  end
end


cmd => rails db:migrate

cmd => rails console
servoperamore = Song.create!(:title => 'Servo per amore',:artist => 'Jesus', :album => 'Superstar jesus',:genre =>'Canzoni della chiesa')
dyonisus = Song.create!(:title => 'Dyonisus',:artist => 'BTS',:genre =>'K-pop')
nostalgia = Song.create!(:title => 'Nostalgia',:artist => 'sanjohngiangino',:genre =>'indie')

rials => quit


gemfile // write gem 'haml'

cmd => bundle install

app\views\songs

new index.html.haml

%h1 All songs

%table#songs
 %thead
  %tr
   %th Song Title
   %th Artist
   %th Album
   %th Genre
   %th Release Date
   %th More info
 %tbody
  -@all.each do |song|
   %tr
    %td= song.title
    %td= song.artist
    %td= song.album
    %td= song.genre
    #%td data
    %td= link_to "Details", song_path(song)
 #{link_to 'Add new song', new_song_path}


modifica songs_controller

class SongsController < ApplicationController
	skip_before_action :verify_authenticity_token
	
	def index
		@all = Song.all
		#render json: Movie.all
	end
	
	def show
		id = params[:id]
		if Song.exists?(id)
			@song = Song.find(id)
		else 
			render html: 'Song does not exist'
		end
	end
	
	def new
	
	end
	
	def create
		p = params.require(:song).permit(:title,:release_date,:genre)
		#title = params[:movie].require(:title)
		#rating = params[:movie][:rating]
		#release_date = params[:movie].[:release_date]
		Song.create(p)
		#render json: params[:movie]
		redirect_to songs_path
	end
	
	def destroy
		Song.find(params[:id]).destroy
		#id = params[:id]
		#if Movie.exists?(id)
		#	Movie.find(id).destroy
		#else 
		#	render html: 'Movie does not exist'
		#end
		#render json: 'Movie numero '+id+' distrutto'
		redirect_to songs_path
	end
	
	def edit
		@song = Song.find(params[:id])
	end
	
	def update
		Song.find(params[:id]).update(params[:song].permit(:title,:release_date,:genre))
		redirect_to songs_path
	end

end


cmd => rails db:prepare test
cmd => rails g cucumber:install
