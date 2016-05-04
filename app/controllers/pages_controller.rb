class PagesController < ApplicationController
  include ActionController::Live

  def sse
    # response.header["Content-Type"] = "text/event-stream"
    # 100.times do |i|
    #   response.stream.write "Data #{i}"
    #   sleep 0.1
    # end

    response.headers['Content-Type'] = 'text/event-stream'

    3.times do |n|
      response.stream.write "Data: #{Time.now}....\n\n"
      sleep 1
    end
  ensure
    response.stream.close
  end

  def home
  end
end
