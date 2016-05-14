require_relative 'common.rb'
require 'sinatra'

get '/*/order' do
  site = params[:splat][0]

  # クローリングリクエスト受信完了メール
  `echo '#{site} クローリングリクエスト受付完了！\n\n#{params.pretty_inspect}' | mail -s '【#{site}】クローリングリクエスト受付完了メール' buppan@moku.me`
end
