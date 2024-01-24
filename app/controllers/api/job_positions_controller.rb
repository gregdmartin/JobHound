module Api
  class JobPositionsController < ApplicationController
    def index
      positions = JobPosition.all.includes(:company).map do |position|
        position.attributes.merge({company: position.company.attributes})
      end

      render json: positions
    end
  end
end