require_relative 'common.rb'

class Writer

  def show
    client_id     = "1006632642147-qb9bs1dbtejr4ule023bt2paf57512uu.apps.googleusercontent.com"
    client_secret = "Hk17usAQKG7Y_65F0XpkYA1S"
    refresh_token = "1/fS8VH2Tlc7KxcOSzF5qrJmVUrGOY5tHE54gHBFN1ETtIgOrJDtdun6zK6XiATCKT"
    client = OAuth2::Client.new(
      client_id,
      client_secret,
      site: "https://accounts.google.com",
      token_url: "/o/oauth2/token",
      authorize_url: "/o/oauth2/auth")
    auth_token = OAuth2::AccessToken.from_hash(client,{:refresh_token => refresh_token, :expires_at => 3600})
    auth_token = auth_token.refresh!
    session = GoogleDrive.login_with_oauth(auth_token.token)
    ws = session.spreadsheet_by_key("10Baml-CzMr96SZDS98zSmn9C20e86C3-1KoWkCVOr0I").worksheets[0]

    # レコード数を取得
    p ws.num_rows
    # カラム数を取得
    p ws.num_cols

    #pp ws.rows

    # ws.num_rows.times do |i|
    #   p i
    # end

    # ws[59, 50] = "test_input!"
    #
    # ws.save

  end

end
