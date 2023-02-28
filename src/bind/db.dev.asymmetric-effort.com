;
; db.dev.asymmetric-effort.com
;   This zone file is the local development
;   laptop environment.
;
$TTL	60
@	IN	SOA	dev.asymmetric-effort.com. root.dev.asymmetric-effort.com. (
			 {{SERIAL}}	; Serial
			 604800		; Refresh
			  86400		; Retry
			2419200		; Expire
			 604800 )	; Negative Cache TTL
;
@	       IN	NS	dev.asymmetric-effort.com.
@          IN A {{DOCKER_GATEWAY_IP_ADDRESS}}
@          IN A 10.37.129.2.
dns        IN A 10.37.129.2. ; DNS Server IP.

auth       IN A 10.37.129.2.  ; LDAP+Kerberos directory server
build      IN A 10.37.129.2.  ; Build Server
docker     IN A 10.37.129.2.  ; Docker Registry
git        IN A 10.37.129.2.  ; Git Server
k8s        IN A 10.37.129.2.  ; Kubernetes Worker
monitoring IN A 10.37.129.2.  ; Monitoring
ntp        IN A 10.37.129.2.  ; NTP Server
package    IN A 10.37.129.2.  ; Package Mirror
pki        IN A 10.37.129.2.  ; Public Key Infrastructure (PKI) Server
postgresql IN A 10.37.129.2.  ; PostgreSQL Server
pxe        IN A 10.37.129.2.  ; PXE Boot Server
redis      IN A 10.37.129.2.  ; Redis Server Supporting Core Services
secrets    IN A 10.37.129.2.  ; Secrets Server (Vault)
syslog     IN A 10.37.129.2.  ; Log Server (rsyslog)
