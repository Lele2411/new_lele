class CompanyProfilesController < ApplicationController
    layout "companies/company"
    before_action :render_404_when_not_found_company
    before_action :render_404_when_not_found_company_profile, only: [:update, :show]

    def index
        @profiles = @company.company_profiles.order_by_created_at
        @profile = CompanyProfile.new()
    end

    def create
        @profile = @company.company_profiles.build(profile_params)
        if @profile.save
            redirect_to company_company_profiles_path(@company)
        else
            @profiles = @company.company_profiles.order_by_created_at
            render 'index'
        end
    end

    def update
        if @profile.update(profile_params)
            redirect_to company_company_profiles_path(@company)
        else
            @profiles = @company.company_profiles
            render 'show'
        end
    end

    def show
        unless @profile
            not_found
        end
    end

    private

    def profile_params
        params.require(:company_profile).permit(:company_name, :company_email, :phone_number, :address, :website_url, :logo, :display_time, :status)
    end

    def not_found
        # raise ActionController::RoutingError.new('Not Found')
        render :file => "#{Rails.root}/public/404.html", layout: false, status: :not_found
    end

    def find_company_by_company_id
        @company = Company.find_by(id: params[:company_id])
    end

    def find_company_profile_by_id
        @profile = CompanyProfile.find_by(id: params[:id])
    end

    def render_404_when_not_found_company
        unless find_company_by_company_id
            not_found
        end
    end

    def render_404_when_not_found_company_profile
        unless find_company_profile_by_id
            not_found
        end
    end
end