class InitialSchema < ActiveRecord::Migration[7.1]
  def change
    enable_extension :pgcrypto

    create_table :companies, id: :uuid do |t|
      t.string :name, null: false, index: {unique: true}
      t.string :website_url
      t.timestamps
    end

    create_table :job_positions, id: :uuid do |t|
      t.string :title, null: false
      t.string :job_link
      t.belongs_to :company, type: :uuid
      t.string :status
      t.text :notes
      t.timestamps

      t.index :status
    end

    create_table :job_events, id: :uuid do |t|
      t.belongs_to :job_position, type: :uuid
      t.string :event_type, null: false
      t.string :contact_name
      t.string :contact_info
      t.datetime :occurred_at

      t.index :occurred_at
      t.index :event_type
    end
  end
end
