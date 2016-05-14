module ApplicationHelper
  def broadcast(channel, &block)
    message = {:channel => channel, :data => capture(&block), :ext => {:auth_token => FAYE_TOKEN}}
    uri = URI.parse("https://secure-peak-48127.herokuapp.com/faye") #change to production url.
    Net::HTTP.post_form(uri, :message => message.to_json)
  end
end
