# Sample OIDC provider for WebSphere Liberty #

This project is a sample OIDC provider.

## Prerequisites to develop locally and run the project ##
- Maven 3
- An up-to-date WebSphere Liberty Server
- Any suitable IDE, e.g. Eclipse

## Run the project locally ##

- Create a new liberty server named "oidcProvider"
```
cd <PATH-TO-WLP>
bin/server create oidcProvider
```

- Copy `server.xml`
```
cp <PATH-TO-GITHUB-PROJECT>/src/wlp/server.xml usr/servers/oidcProvider
```

- Create a key store with a self-sign certificate named "default" using `securityUtility` for your host (replace CN below!)
```
bin/securityUtility createSSLCertificate --server=oidcProvider --password=changeit --subject=CN=your-machine,O=yourorg,C=DE
```

- Alternative 2: You can convert a PKCS12 file an store it in the JKS store:
```
cd usr/servers/security01
mkdir -p resources/security
cd resources/security
keytool -v -importkeystore -srckeystore <FILE>.p12 -srcstoretype PKCS12 -destkeystore key.jks -deststoretype JKS -srcalias <SRC-ALIAS> -destalias default
```
   
- Alternative 3: Due to the fact, that liberty is able to read PKCS12 files, you can specify a regular PKCS12 server key pair by changing `server.xml`.
```
	<keyStore id="defaultKeyStore" location="${server.config.dir}/resources/security/<filename>.p12" password="your-pass" type="PKCS12"/>
	<ssl clientAuthentication="true" clientAuthenticationSupported="true"
		id="mySSLSettings" keyStoreRef="defaultKeyStore" securityLevel="HIGH" serverKeyAlias="<name-of-key>"
		sslProtocol="TLS" trustStoreRef="defaultTrustStore"/>
```

- If you want to use SSL client authentication, you must populate the trust store, with a trusted root CA.
```
keytool -import -trustcacerts -keystore trust.jks -alias "default" -file CA.crt
```

- Build the war file 
```
mvn package
```

- Deploy the war file to the new Liberty server
```
cp target/ResourceServer.war <PATH-TO-WLP>/usr/servers/oidcProvider/dropins
```

- Start the server: ```bin/server start oidcProvider```


## Test the project locally ##

- First test of the OIDC provider
```
$ curl -k -H "Content-Type: application/x-www-form-urlencoded;charset=UTF-8" -d "grant_type=password&client_id=rp1&client_secret=secret&username=user01&password=user01&scope=profile" https://localhost:8543/oidc/endpoint/OP/token
```
Returns
```
{"access_token":"0HOt2TPJghf7fEZl83gklVfhDXjWEQWVwqivtuiP","token_type":"Bearer","expires_in":7200,"scope":"profile","refresh_token":"swQS9vNlLk3qOKtCJPTDixvnQCPhzHFtdcvbIzRB7JckB2Ylv0"}
```


## Open issues and TODOs ##
 
- Currently none
