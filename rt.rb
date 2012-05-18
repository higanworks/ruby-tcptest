require "socket"

gs = TCPServer.open(0, 20000)
socks = [gs]
addr = gs.addr
addr.shift
printf("server is on %s\n", addr.join(":"))

while true
  Thread.start(gs.accept) do |s|
    print(s, " is accepted\n")
    while s.gets
      %w[1 5 15 20 30 40 50 60].each do |ss|
      ii = Time.now.to_i
        sleep ss.to_i * 60
        s.write((Time.now.to_i - ii) / 60)
        s.write("min\n")
      end
    end
    print(s, " is gone")
    s.close
  end
end
