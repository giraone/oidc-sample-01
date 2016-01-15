# Sample OIDC Relying Party for WebSphere Liberty #

This project is a sample OIDC relying party.

## Prerequisites to develop locally and run the project ##
- Maven 3
- An up-to-date WebSphere Liberty Server
- Any suitable IDE, e.g. Eclipse

## Run the project locally ##

- Create a new liberty server named "oidcRP"
```
cd <PATH-TO-WLP>
bin/server create oidcRP
```

- Copy `server.xml`
```
cp <PATH-TO-GITHUB-PROJECT>/src/wlp/server.xml usr/servers/oidcRP
```

- Create a key store with a self-sign certificate named "default" using `securityUtility` for your host (replace CN below!)
```
bin/securityUtility createSSLCertificate --server=oidcRP --password=changeit --subject=CN=your-machine,O=yourorg,C=DE
```

- You must import the provider's certificate into the trust store (using the root CA does not work)
```
keytool -import -trustcacerts -keystore trust.jks -alias "default" -file server.crt
```


- Build the war file 
```
mvn package
```

- Deploy the war file to the new Liberty server
```
cp target/RelyingParty.war <PATH-TO-WLP>/usr/servers/oidcRP/dropins
```

- Start the server: ```bin/server start oidcRP```


## Test the project locally ##

- Open browser with URL `https://t530.local:8643/RelyingParty` and login with user01/user01.


## Open issues and TODOs ##
 
- Currently none
