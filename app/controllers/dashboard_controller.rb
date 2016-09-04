class DashboardController < ApplicationController

	def main
		@user = User.find_by(params[:id])
	end
end
