;
; db.internal.asymmetric-effort.com
;   This zone is the internal production
;   zone.
;
$TTL	60
@	IN	SOA	internal.asymmetric-effort.com. root.internal.asymmetric-effort.com. (
			 {{SERIAL}} ; Serial
			 604800		; Refresh
			  86400		; Retry
			2419200		; Expire
			 604800 )	; Negative Cache TTL
;
@	IN	NS	internal.asymmetric-effort.com.
@   IN  A   192.168.5.10
dns     IN A 192.168.5.10 ; DNS Server IP.


auth       IN A 192.168.5.11   ; LDAP+Kerberos directory server
build      IN A 192.168.5.12   ; Build Server
docker     IN A 192.168.5.13  ; Docker Registry
git        IN A 192.168.5.14  ; Git Server
k8s        IN A 192.168.5.15  ; Kubernetes Worker
monitoring IN A 192.168.5.16  ; Monitoring
ntp        IN A 192.168.5.17  ; NTP Server
package    IN A 192.168.5.18  ; Package Mirror
pki        IN A 192.168.5.19  ; Public Key Infrastructure (PKI) Server
postgresql IN A 192.168.5.20  ; PostgreSQL Server
pxe        IN A 192.168.5.21  ; PXE Boot Server
redis      IN A 192.168.5.22  ; Redis Server Supporting Core Services
secrets    IN A 192.168.5.23  ; Secrets Server (Vault)
syslog     IN A 192.168.5.24  ; Log Server (rsyslog)

gw.lan     IN A 192.168.3.1  ; blue-wire personal_data vlan210 VRRP group 03 vip
gw.work    IN A 192.168.4.1  ; blue-wire personal_data vlan220 VRRP group 04 vip
gw.compute IN A 192.168.5.1  ; blue-wire personal_data vlan310 VRRP group 05 vip
gw.k8s     IN A 192.168.6.1  ; blue-wire personal_data vlan310 VRRP group 06 vip
gw.data    IN A 192.168.7.1  ; blue-wire personal_data vlan320 VRRP group 07 vip
gw.mgmt    IN A 192.168.10.1  ; blue-wire personal_data vlan330 VRRP group 10 vip
gw.cameras IN A 192.168.20.1  ; blue-wire personal_data vlan410 VRRP group 20 vip

eth1.edge00 IN A 192.168.5.2  ; Juniper J2320 Router
eth2.edge00 IN A 192.168.5.3  ; Juniper J2320 Router

eth1.edge01 IN A 192.168.5.4  ; Juniper J2320 Router
eth2.edge01 IN A 192.168.5.5  ; Juniper J2320 Router

svr00       IN A 192.168.5.40  ; DL580G7 bond0 (eth0, eth1, eth2, eth3)
svr01       IN A 192.168.5.41  ; DL680G7 bond0 (eth0, eth1, eth2, eth3)
;svr02      IN A 192.168.5.42  ; Reserved for future server (bond)
;svr03      IN A 192.168.5.43  ; Reserved for future server (bond)

sw00        IN A 192.168.5.51  ; Juniper EX4200 48 port POE+ Switch
sw01        IN A 192.168.5.52  ; Juniper EX4200 48 port POE+ Switch
;sw02       IN A 192.168.5.53  ; Reserved for future switch
;sw03       IN A 192.168.5.54  ; Reserved for future switch

; Reserve 192.168.6.0/24 for kubernetes
; Reserve 192.168.7.0/24 for rock64 storage cluster.
