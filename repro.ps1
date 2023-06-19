& docker run -d `
  --name "basic-nginx-with-self-signed-cert" `
  -p 8000:443 `
  -v ".\nginx-config:/etc/nginx/conf.d" `
  -v ".\certs:/etc/ssl/papertrace-certs" `
  nginx:1.25.1

# The following command should bypass the 'Your Connection is not
# private' screen but does not. Replace 'ignore-certificate-errors-spki-list'
# with '--ignore-certificate-errors' and it works as expected.
& 'C:\Program Files\Google\Chrome\Application\chrome.exe' `
  --incognito `
  --user-data-dir="$HOME\AppData\Local\Google\Chrome\User Data\chrome-spki-list-repro" `
  --ignore-certificate-errors-spki-list="h4Qwhn4pG0ug93O6OpuP2J6wmThu7ga9pS09rstxDDs=" `
  "https://localhost:8000"

