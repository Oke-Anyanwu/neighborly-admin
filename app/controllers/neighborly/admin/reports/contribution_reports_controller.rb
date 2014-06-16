module Neighborly::Admin
  class Reports::ContributionReportsController < Reports::BaseController
    def collection
      project = Project.find(params[:project_id])
      ContributionReport.per_project(project)
    end
  end
end
