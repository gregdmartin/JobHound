class JobPosition < ApplicationRecord
  belongs_to :company
  has_many :job_events
end
