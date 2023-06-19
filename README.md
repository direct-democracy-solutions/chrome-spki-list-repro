# Chrome ignore-errors-spki-list reproduction

## System Requirements
- Docker Core and Docker CLI
- PowerShell
- (optional) OpenSSL CLI

## To Use:
*Warning.* This script starts Chrome in a degraded security state and is
intended to be run by professionals diagnosing a specific issue. _Do
Not_ execute things like this unless you know what you are doing.

1. Read `repro.ps1` and make sure you fully understand and are comfortable executing it. 

2. Verify the certificate fingerprint on line 14 is correct. I copied
  the SHA-256 hex fingerprint from the certificate details window in
  Chrome following command and then pasted the hex fingerprint into [Cryptii](https://cryptii.com/). You can also use OpenSSL:
```powershell
openssl x509 -noout -fingerprint -sha256 -inform der -in .\certs\nginx.crt
```

3. Execute `.\repro.ps1` in PowerShell. An Nginx container will start
 with a self-signed cert and Chrome will open up with the certificate
 whitelisted and navigate to the site. It should go directly to the site
 showing a Not Secure.