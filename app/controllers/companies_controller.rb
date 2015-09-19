class CompaniesController < InheritedResources::Base
  def new
    @company = Company.new
  end

  def create
    Company.create(company_params)
    redirect_to companies_path
  end

  def index
    @companies = Company.all
  end

  private

    def company
      @company ||= Company.find(params[:id])
    end

    def company_params
      params.require(:company).permit(:legal_name, :fantasy_name, :cuit)
    end
end

