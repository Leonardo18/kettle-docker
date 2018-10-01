#!/usr/bin/env python

import BaseHTTPServer
import CGIHTTPServer
import cgitb

cgitb.enable()

print("Starting server.py")

server = BaseHTTPServer.HTTPServer
handler = CGIHTTPServer.CGIHTTPRequestHandler
server_address = ("", 8080)

handler.cgi_directories = ["/job"]

httpd = server(server_address, handler)
httpd.serve_forever()

