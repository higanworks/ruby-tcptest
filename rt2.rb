require "socket"
require "time"
require "date"

gs = TCPServer.open(0, 20000)
socks = [gs]
addr = gs.addr
addr.shift
printf("server is on %s\n", addr.join(":"))

while true
  Thread.start(gs.accept) do |s|
    print(s, " is accepted\n")
    s.write("Please send integer x. Server will return response after x seconds.\n\n")
    while s.gets
      ii = $_.to_i
      if ii > 0
        tts = Time.now
        ttd = tts + ii
        s.write("See you after #{ii} seconds!\n")
        s.write("  Now: #{tts}\n")
        s.write("Until: #{ttd}\n\n")
        sleep ii
        tts = Time.now
        s.write("Have you been waiting #{ii} seconds?\n")
        s.write("  Now: #{tts}\n\n")
        s.write("Please send integer x. Server will return response after x seconds.\n\n")
      end
    end
    print(s, " is gone")
    s.close
  end
end
