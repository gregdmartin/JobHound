class JobPositionsController < ApplicationController
  def index
    @job_positions = JobPosition.all
  end
end
