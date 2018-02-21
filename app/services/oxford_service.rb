class OxfordService

  attr_reader :conn

  def initialize
    @conn = Faraday.new(url: "https://od-api.oxforddictionaries.com/api/v1") do |faraday|
        faraday.adapter                         Faraday.default_adapter
        faraday.headers['app_id']             = ENV["app_id"]
        faraday.headers["app_key"]            = ENV["app_key"]
    end
  end

  def get_json(word)
    @conn.get("inflections/en/#{word}")
  end

  def parse_json
    JSON.parse(get_json(word).body, symbolize_names: true)
  end

  def map_json
    # get_json(word)[:results][0][].map do |raw|
    #   Input.new(raw)
    # end
  end
end