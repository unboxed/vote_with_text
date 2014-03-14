http = require 'http'

PORT = 8124
LOCALHOST = "127.0.0.1"
HTTP_SUCCESS = 200
HTTP_REDIRECT = 301

app = http.createServer (req, res) -> 
  console.log "called #{req.method}: #{req.url}"

  if req.url is '/topic' and req.method is 'POST'
    res.writeHead HTTP_REDIRECT,
      'Location': '/topic/1'
    res.end()
  else  
    res.writeHead HTTP_SUCCESS, 
      'Content-Type': 'text/html'
    res.end """
      <html>
        <body>
          <p id="welcome">Welcome to 'Super Awesome' type in a description of your topic below</p>
          <form method="POST" action="/topic">
            <textarea id="description"></textarea><br>
            <button type="submit">Make Topic</button>
          </form>
        </body>
      </html>
    """

app.listen PORT, LOCALHOST

console.log "Server running at #{LOCALHOST}, #{PORT}"

