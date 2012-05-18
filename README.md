## Overview

wait and push via telnet.

## Usage

### Server
    $ ruby ./rt2.rb 


### Client
    $ telnet localhost 20000
    Trying 127.0.0.1...
    Connected to localhost.
    Escape character is '^]'.
    Please send integer x. Server will return response after x seconds.
    
    20
    See you after 20 seconds!
      Now: 2012-05-18 10:02:26 +0900
    Until: 2012-05-18 10:02:46 +0900
    
    Have you been waiting 20 seconds?
      Now: 2012-05-18 10:02:46 +0900

# License

MIT: LICENSE.txt