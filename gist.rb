class Gist
  attr_reader :language, :extension, :url

  def initialize(json)
    @url = json['raw_url']
    @language = json['language']
    @extension = json['filename']
  end
end
