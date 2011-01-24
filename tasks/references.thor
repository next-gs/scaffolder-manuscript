class References < Thor::Group

  BIB = File.join(File.dirname(__FILE__),'..','text','src','article.bib')

  def fetch
    address = "http://www.citeulike.org/bibtex/user/michaelbarton/tag/mdb-manuscript-2"
    require 'open-uri'
    open(address) do |uri|
      File.open(BIB,'w') do |file|
        uri.each do |line|
          file << line
        end
      end
    end
  end

  def tidy
    command = String.new
    command << '/url/d;'
    command << '/day/d;'
    command << '/citeulike/d;'
    `sed -i -e '#{command}' #{BIB}`
    `rm #{BIB}-e`
  end

end
