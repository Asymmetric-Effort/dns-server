Asymmetric-Effort/Bootstrap/Dns-Server
======================================
(c) 2023 Sam Caldwell. See LICENSE.txt

## Objective:

* To establish a dev internal DNS zone to run off the local development laptop for
  development and bootstrapping.
* To establish an internal DNS zone to run the asymmetric-effort local network.

## DNS Zones

* This solution will operate in a "dev" (local) and "prod" mode by setting the environment
  variable ENVIRONMENT to "dev" or "prod".

| ENVIRONMENT | DNS Zone                       |
|-------------|--------------------------------|
| dev         | dev.asymmetric-effort.com      |
| prod        | internal.asymmetric-effort.com |


## Building Container

To build the container...

1. Clone this repo
2. Navigate to the directory
3. Run `make dns_server/build`

## To Run Local Container (dev environment)
1. Build the container locally (see above).
2. Run `make dns_server/run/dev`

## To Run Local Container (for bootstrapping)
1. Build the container locally (see above).
2. Run `make dns_server/run/prod` on the local development laptop.

## To Run On Production Servers
1. Build the container (see above).
2. Run `make dns_server/upload` to upload the image to the Docker registry.
3. Run `make dns_server/run/prod` on the production servers.

## To Upload the Image
To upload the container image:
1. Build the container (see above)
2. Run `make dns_server/upload`
    > Disclaimer: This currently is not implemented and
    > by design it will only upload to my local docker hub.

## Stop Services

To stop the git server, run `make dns_server/stop`

## Tailing logs of running services

To tail the logs, run `make dns_server/logs`
