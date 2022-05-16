class PaginationController < ApplicationController

    def create
        select_pagination_options = ["5", "10", "20"]
        if select_pagination_options.include? params[:option_row_of_per_page]
            session[:perpage] = params[:option_row_of_per_page]
        end
        redirect_to companies_path(:string_params => {:company_code_cont => params[:company_code_param], :company_name_cont => params[:company_name_param], :company_email_cont => params[:company_email_param], :phone_number_cont => params[:phone_number_param],:status_eq => params[:status_param]})
    end

end
