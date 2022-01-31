all: ca client server
ca: certs/ca.pem
client: certs/client.pem
server: certs/server.pem

certs:
	mkdir -p certs


certs/ca.pem: certs
	cfssl gencert -initca \
		configs/ca.json | cfssljson -bare certs/ca


certs/client.pem: certs
	cfssl gencert \
		-ca=certs/ca.pem \
      	-ca-key=certs/ca-key.pem \
      	-config=configs/ca-config.json \
      	-profile=client \
      	configs/client.json | cfssljson -bare certs/client


certs/server.pem: certs
	cfssl gencert \
		-ca=certs/ca.pem \
		-ca-key=certs/ca-key.pem \
		-config=configs/ca-config.json \
		-profile=server \
		configs/server.json | cfssljson -bare certs/server


.PHONY: clean
clean:
	rm certs/*.csr
	rm certs/*.pem
