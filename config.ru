# config.ru
run Proc.new { |env|
  response = 200
  content_type = "text/html"

  case env['REQUEST_PATH']
  when "/"
    content = File.read("index.html")
  when "/time"
    content_type = "text/plain"
    content = "Time is #{Time.now}"
  when "/jquery.js"
    content_type = "text/javascript"
    content = File.read("jquery.js")
  else
    response = 404
    content = "File not found!"
  end

  [
   response,
   {"Content-Type" => content_type},
   content
  ]
}

