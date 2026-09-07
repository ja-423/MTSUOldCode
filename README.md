### ssh
- ssh (username)@(ip address) 

### scp
- scp (domain):(filename) (location)

### From Local
- scp (filename) (domain):(location)

### From local to server:
- scp file1.txt file2.sh username@ip.of.server.copyto:~/pathtoupload

### From server to local:
- scp -T username@ip.of.server.copyfrom:"file1.txt file2.txt" "~/yourpathtocopy"
- scp -T (username)@(domain):~/(files) .

### To Copy multiple items form sub folders/ From server to local:
- scp -r (username)@(domain):~/(path) . 
  - (Will include the parent folders as well)

### tar files
- tar -czvf name-of-archive.tar.gz /path/to/directory-or-file