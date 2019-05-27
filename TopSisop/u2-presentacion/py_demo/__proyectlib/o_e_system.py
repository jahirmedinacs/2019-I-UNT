#! /usr/bin/python3 -i

from subprocess import call, Popen, PIPE

def o_e_system(cmd):
    proc = Popen(cmd, stdout=PIPE, stderr=PIPE)
    o, e = proc.communicate()

    return o.decode("utf-8").strip(), e.decode("utf-8").strip()

