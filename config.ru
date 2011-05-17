require "rubygems"
require "bundler"

Bundler.setup(:default, :production)

require "rack/contrib"
require "rack-rewrite"

use Rack::StaticCache, :urls => ["/images","/stylesheets","/favicon.ico"], :root => "generated"
use Rack::ETag
use Rack::Rewrite do
  rewrite "/", "/index.html"
end
run Rack::Directory.new("generated")