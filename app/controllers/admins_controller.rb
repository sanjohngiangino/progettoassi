class AdminsController < ActionController::Base

	def index

		@users = User.all
	end


	def ban_user
		u = User.find(params[:id])
		u.unset_iscritto
		redirect_to :admin_view
	end


	def unban_user
		u = User.find(params[:id])
		u.set_iscritto
		redirect_to :admin_view
	end

	def admin_user
		u = User.find(params[:id])
		u.set_admin
		redirect_to :admin_view
	end


	def unadmin_user
		u = User.find(params[:id])
		u.unset_admin
		redirect_to :admin_view
	end

	def editor_user
		u = User.find(params[:id])
		u.set_editor
		redirect_to :admin_view
	end


	def uneditor_user
		u = User.find(params[:id])
		u.unset_editor
		redirect_to :admin_view
	end


end