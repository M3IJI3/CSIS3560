import nmap

nm = nmap.PortScanner()

for host in nm.all_hosts():
    print("-------------")
    print("Hosts: %s (%s)" %(host), nm[host].hostname)