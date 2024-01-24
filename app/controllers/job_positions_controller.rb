class JobPositionsController < ApplicationController
  def index
    @job_positions = JobPosition.all.includes(:company).map do |position|
      # Convert model objects into hashes via `attributes`, include associated company info
      # This makes it easier for the JS logic to work with.
      position.attributes.merge({company: position.company.attributes})
    end
  end
end
