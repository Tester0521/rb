require 'webrick'

class SimpleServer < WEBrick::HTTPServlet::AbstractServlet
  def do_GET(request, response)

    response.status = 200
    response.content_type = 'text/html'

    response.body = <<-HTML
      <!DOCTYPE html>
      <html lang="en">
      <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Hello world | by qitteenn</title>
      </head>
      <body>
        <h1>Hello, world!</h1>
        <p>This is a simple web server running on Ruby.</p>
      </body>
      </html>
    HTML
  end
end

server = WEBrick::HTTPServer.new(:Port => 8000)

server.mount "/", SimpleServer

trap "INT" do
  server.shutdown
end

server.start
