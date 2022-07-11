# frozen_string_literal: true

job_type :sidekiq, "cd :path && :environment_variable=:environment bundle exec sidekiq-client push :task :output"

every :monday, at: "23:57 pm", roles: [:app] do
  sidekiq "ExecuteDisbursementsWorker"
end
