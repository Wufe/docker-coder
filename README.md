# Coder image

Docker image to enable editing your code online in a browser.

Includes:
- zsh
- yarn
- typescript
- go

### How to run

`docker run --name coder -d -p 127.0.0.1:8443:8080 -v "/home:/home" -e PASSWORD=YourSecurePassword --security-opt seccomp=unconfined kesshin/coder:latest --allow-http --auth=password`

Then the coder server will be available on port `8443`.