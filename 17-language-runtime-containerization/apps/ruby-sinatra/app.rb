require "json"
require "sinatra/base"

class CourseApp < Sinatra::Base
  SERVICE_NAME = "ruby-sinatra"

  set :bind, ENV.fetch("RACK_HOST", "0.0.0.0")
  set :port, ENV.fetch("RACK_PORT", "4567")

  before do
    content_type :json
  end

  get "/" do
    {
      service: SERVICE_NAME,
      language: "Ruby",
      framework: "Sinatra",
      message: "hello from Ruby Sinatra"
    }.to_json
  end

  get "/healthz" do
    { status: "ok", service: SERVICE_NAME }.to_json
  end

  get "/work" do
    started = Process.clock_gettime(Process::CLOCK_MONOTONIC)
    result = (0...10_000).sum
    elapsed_ms = ((Process.clock_gettime(Process::CLOCK_MONOTONIC) - started) * 1000).round(3)
    { service: SERVICE_NAME, result: result, elapsed_ms: elapsed_ms }.to_json
  end

  run! if app_file == $PROGRAM_NAME
end

