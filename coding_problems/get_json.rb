require 'faraday'
require 'json'

URL = "https://letsrevolutionizetesting.com/challenge"
HOST = "www.letsrevolutionizetesting.com"

def get_json(uri, headers)
  response = Faraday.new(
    uri.to_s,
    headers: headers
  ).get

  unless response.status == 200
    puts "HTTP request failed"
    puts response
  end

  JSON.parse response.body
end

def append_json_to_uri(uri)
  unless uri.path.end_with? '.json'
    uri.path += ".json"
  end
  uri.to_s
end

def main
  url = URL
  previous_url = nil
  headers = {
    Host: HOST
  }

  while url.to_s.length > 0
    uri = append_json_to_uri(URI.parse url)
    headers['Referer'] = previous_url || uri.to_s

    response = get_json(uri, headers)
    puts response
    previous_url = uri.to_s
    url = response['follow']
  end
end

main()

