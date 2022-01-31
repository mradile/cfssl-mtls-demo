# CFSSL Demo
This repository contains examples for creating a CA, client and server certificates for testing mTLS authentication.

## Dependencies
To run this demo you need `make` and the Cloudflare SSL Tools:

```bash
brew instal cfssl
```

## Configuration
You can leave almost all of the configuration options as they are. 
If you are testing with other hosts than localhost, you should add your hostnames to the `hosts` array in [configs/server.json](configs/server.json):
```json
{
  "hosts": [
    "your.host.net",
    "your.other.host.net",
    "127.0.0.1",
    "localhost"
  ],
  ...
}
```

## Create Certificates
To create all certificates run the following command:

```bash
make all
```

This will create some files in the `certs` directory. The most important are:

* `ca.pem`: The CA file.
* `client.pem` & `client-key.pem`: The key and certificate for the client application
* `server.pem` & `server-key.pem`: The key and certificate for the server application

## Cleanup
To delete all files run:

```bash
make clean
```
