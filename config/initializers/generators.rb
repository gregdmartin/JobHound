Rails.application.config.generators do |g|
  g.orm :active_record, primar_key_type: :uuid
end