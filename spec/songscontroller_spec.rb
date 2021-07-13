require 'rails_helper.rb'
describe SongsController, type: :controller do
 	fixtures :all


	#General
	it "should return three songs from the fixtures" do	
		adm = users(:admin)
		sign_in adm
		get :index
		expect(assigns(:songs).size).to eql(3)
	end

	#Banned
	context "with Banned privileges" do
		before :each do
			banned = users(:banned)
			sign_in banned
		end
		#Create
		it "should not create songs" do
			params = {:song=>{:title => "Title", :artist => "Artist", :year => 1900 ,:genre => 'Genre',:lyric => 'Lyric'}}
			get :create, :params => params
			m_tst = Song.where(:title => "Title")
			expect(m_tst).to be_empty
		end
		#Retrieve
		it "should retrieve songs" do
			mv = songs(:one_sg)
			params = {:id => mv.id}
			get :show, :params => params
			expect(assigns(:song)).to eql(mv)
		end

		#Update

		it "should not update songs" do
			mv = songs(:one_sg)
			params = {:id => mv.id, :song=>{:title => "Title"}}
			get :update, :params => params
			m_tst = Song.find(mv.id)
			expect(m_tst.title).to eql(mv.title)
		end


	end


	#Editor
	context "with Editor privileges" do
		before :each do
			editor = users(:editor)
			sign_in editor
		end
		#Retrieve
		it "should retrieve songs" do
			mv = songs(:one_sg)
			params = {:id => mv.id}
			get :show, :params => params
			expect(assigns(:song)).to eql(mv)
		end

		#Delete
		it "should destroy songs" do
			mv = songs(:one_sg)
			params = {:id => mv.id}
			get :destroy, :params => params
			m_tst = Song.where(:id => mv.id)
			expect(m_tst).to be_empty
		end




	end

	#Admins
	context "with Admin privileges" do
		before :each do
			admin = users(:admin)
			sign_in admin
		end

		#Retrieve
		it "should retrieve songs" do
			mv = songs(:one_sg)
			params = {:id => mv.id}
			get :show, :params => params
			expect(assigns(:song)).to eql(mv)
		end


		#Delete
		it "should destroy songs" do
			mv = songs(:one_sg)
			params = {:id => mv.id}
			get :destroy, :params => params
			m_tst = Song.where(:id => mv.id)
			expect(m_tst).to be_empty
		end

	end

end