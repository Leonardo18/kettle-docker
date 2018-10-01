#!/usr/bin/env python
import sys
import shlex
import subprocess
from subprocess import call,check_output, os, Popen, CalledProcessError, PIPE

env = os.environ.copy()

print "Content-Type: text/html\n\n"
print "OK"
cmd = ['./job/job.sh']

sys.stderr.write("Starting job.\n")

cmd = "/app/job/job.sh"
print cmd

try:
    p = Popen(shlex.split(cmd), stdout=PIPE, stderr=PIPE)
    stdout, stderr = p.communicate()
    for line in stdout:
        sys.stderr.write(line)
except CalledProcessError as e:
    raise RuntimeError("command '{}' return with error (code {}):{}".format(e.cmd, e.returncode, e.output))
