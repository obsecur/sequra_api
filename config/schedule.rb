# frozen_string_literal: true

job_type :sidekiq, "cd :path && :environment_variable=:environment bundle exec sidekiq-client push :task :output"

every :monday, at: "00:00 am", roles: [:app] do
  sidekiq "ExecuteDisbursementsWorker"
end
