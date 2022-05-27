class CompanyProfilesController < ApplicationController
    before_action :find_company_by_company_id

    def index
        unless @company
            not_found
        else
            @profiles = @company.company_profiles
            @profile = CompanyProfile.new()
        end
    end

    def create
        @profile = CompanyProfile.new(profile_params)
        @profile.company_code = @company.company_code
        if @profile.save
            redirect_to company_company_profiles_path(@company)
        else
            @profiles = @company.company_profiles
            render 'index'
        end
    end

    private

    def profile_params
        params.require(:company_profile).permit(:company_name, :company_email, :phone_number, :address, :website_url, :logo, :display_time)
    end

    def not_found
        # raise ActionController::RoutingError.new('Not Found')
        render :file => "#{Rails.root}/public/404.html", layout: false, status: :not_found
    end

    def find_company_by_company_id
        @company = Company.find_by(id: params[:company_id])
    end
end