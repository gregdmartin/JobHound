class AddContextToPositions < ActiveRecord::Migration[7.1]
  def change
    # This represents an 'area' or 'problem space' that the position might be hiring for. This is used to differentiate positions
    # with the same title for the same company.
    add_column :job_positions, :domain, :string

    # when the position was posted. This is useful as a timeline element not invoked by the user, and to inform the user how reasonable
    # it might be to expect some form of response
    add_column :job_positions, :posted_on, :datetime

    # a user-defined value stating how interested/excited they are for the prospect of working for the given company in the position considering
    # all of context.
    add_column :job_positions, :interest_level, :decimal, precision: 5, scale: 2
    add_index :job_positions, :interest_level
  end
end
