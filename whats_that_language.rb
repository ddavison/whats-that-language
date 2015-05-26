require 'json'
require './gist'

class WhatsThatLanguage
  attr_reader :gists, :options, :ignore

  def initialize
    @gists = []
    @options = []
    @ignore = %w(Text Markdown JSON)

    all = JSON.parse(from_github("/gists/public?page=#{rand(1..20)}"))
    if all.any?
      all.each do |gist|
        g = Gist.new(gist['files'].first[1])
        @gists << g unless g.nil? or g.language == nil or @ignore.include? g.language
      end
    end
  end

  def get_new_gist
    gist = @gists[rand(0..@gists.length-1)]

    # return a JSON object like this, for the app:
    # {
    #   "code": "def blah_blah..."
    #   "language": "Ruby"
    #   "extension": "rb"
    #   "options": ["C", "Ruby", "Go", "Haskell"]
    # }
    i = 0
    begin
      random_gist = @gists[rand(0..@gists.length-1)]
      next if @options.include? random_gist.language or gist.language == random_gist.language
      @options << random_gist.language
      i += 1
    end until i == 3
    code = open(gist.url).read

    {
      code: code.force_encoding('ASCII-8BIT').encode('UTF-8', undef: :replace, replace: ''),
      language: gist.language,
      extension: gist.extension,
      options: @options.insert(rand(0..3), gist.language)
    }
  end

  # fetch something from github
  def from_github(path)
    # open("https://api.github.com#{path}").read.force_encoding('ASCII-8BIT').encode('UTF-8', undef: :replace, replace: '')
    File.read('sample.json')
  end
end
