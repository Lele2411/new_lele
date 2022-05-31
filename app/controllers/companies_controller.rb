class CompaniesController < ApplicationController
    layout "companies/company"
    before_action :find_company_by_id, only: [:show, :update, :destroy]
    before_action :auth_admin_log_in

    def new
        @company = Company.new
        @company.company_profiles.build
    end

    def index
        @params = params[:q] || params[:string_params]
        # @q = Company.ransack(@params)
        # @current_page = (params[:page] || 1).to_i
        # @per_page = (session[:perpage] || 20).to_i
        # @companies = @q.result.includes(:company_profiles).where(company_profiles: { display_time: Date.today }).order("company_profiles.id": "DESC").paginate(page: params[:page], per_page: @per_page)
        @q = CompanProfiles.ransack(@params)
        @current_page = (params[:page] || 1).to_i
        @per_page = (session[:perpage] || 20).to_i
        @profiles = @q.result.includes(:company).where('display_time': Date_today).paginate(page: params[:page], per_page: @per_page)
    end

    def show
        unless @company
            not_found
        end
        @applied_profile = @company.company_profiles.where('display_time': Date.today).order('id': 'DESC').first
    end

    def create
        @company = Company.new(company_params)
        if @company.save
            redirect_to companies_path
        else
            render 'new'
        end
    end

    def edit
    end

    def update
        if @company.update(update_company_params)
            flash[:update_success] = true
            redirect_to company_path(@company)
        else
            render 'new'
        end
    end

    def destroy
        unless @company
            not_found
        else
            @company.destroy
            flash[:success] = "Delete Company Successful!"
            redirect_to companies_path
        end
    end

    private

    def company_params
        params.require(:company).permit(:company_code, company_profiles_attributes: [:company_name, :company_email, :phone_number, :address, :website_url, :logo, :display_time])
    end

    def update_company_params
        params.require(:company).permit(:company_code, :company_name, :company_email, :phone_number, :address, :website_url, :logo, :status)
    end

    def not_found
        # raise ActionController::RoutingError.new('Not Found')
        render :file => "#{Rails.root}/public/404.html", layout: false, status: :not_found
    end

    def find_company_by_id
        @company = Company.find_by(id: params[:id])
    end
end
