class AdsController < ApplicationController

	before_action :check_logged_in, :only => [:edit, :update]
	#before_filterでもいけるがrails4では非推奨

	def new
		@ad = Ad.new
	end

	def create
		@ad = Ad.new(ad_params)
		@ad.save
		redirect_to "/ads/#{@ad.id}"
		#redirect_to @adでも飛べる
	end

	def index
		@ad = Ad.all
	end

	def destroy
		@ad = Ad.find(params[:id])
		@ad.destroy
		redirect_to ads_path
	end

	def show
		@ad = Ad.find(params[:id])
	end

	def edit
		@ad = Ad.find(params[:id])
	end

	def update
		@ad = Ad.find(params[:id])
		@ad.update_attributes(ad_params)
		#update_attributesはupdateで略せる
		redirect_to @ad
	end

	private

		def ad_params
			params[:ad].permit(:name, :description, :price, :seller_id, :email, :img_url)
		end

		def check_logged_in
			authenticate_or_request_with_http_basic("ads") do |username, password|
				username == "admin" && password == "kiyama1226"
			end
			
		end


end
