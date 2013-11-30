class TweetsController < ActionController::Base
  include ActionController::Live

  def index
  end

  def stream

    response.headers['Content-Type'] = "text/event-stream\n\n"

    # client = Twitter::Streaming::Client.new do |config|
    #   config.consumer_key        = "V1BVNqAJKxrNvm6liSCww"
    #   config.consumer_secret     = "TeAJUyTLWKuOoXKZyveiRGtprfixXKIrlC796YP3NU"
    #   config.access_token        = "2191389770-gb84qbU8KyaQXLETFEEsX3nfwzNOouwOiV3oAL0"
    #   config.access_token_secret = "J2FYXK2ofxwAPEZztRqsWMcAXLscTRWWAQ8J1OrirHN9g"
    # end

    # topics = ["coffee", "tea"]
    # @coffee = 0
    # @tea = 0

      sse = ServerSide::SSE.new(response.stream)
    begin
    #   client.filter(:track => topics.join(",")) do |tweet|
    #     @coffee += 1 if tweet.text.match('coffee')
    #     @tea += 1 if tweet.text.match('tea')
    #     response.stream.write "data: Coffee #{@coffee}, and Tea: #{@tea}"
    #   end

    1000.times do |x|
      sse.write "data: #{x}\n\n".to_json

    end

    rescue IOError
      # When the client disconnects, we'll get an IOError on write
    ensure
      sse.close
      puts '*' * 80
      puts "stream closed"
    end
  end
end