# get '/' do
#   # Deja a los usuarios crear una URL reducida y despliega una lista de URLs.
#   @urls = Url.all
#   session['email'] ||= nil
#   @user_urls = Url.where(creator: session['email'])
#   erb :index
# end
#
# get '/debug' do
#   @urls = Url.all
#   @urls.each do |url|
#     p url
#   end
#   erb :debug
# end
