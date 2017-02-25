# Docker Alliance
Alliance in a container

[![license](https://img.shields.io/github/license/oconnormi/docker-alliance.svg?maxAge=2592000?style=flat-square)](https://github.com/oconnormi/docker-alliance/blob/master/LICENSE)

## What is Alliance?
See the [alliance homepage](https://github.com/codice/alliance)

## Usage

To start a basic default Alliance instance

```
docker run -name some-alliance -d oconnormi/alliance
```

To expose the alliance ui:

```
docker run -name some-alliance -d -p 8993:8993 oconnormi/alliance
```

## Persistence

To persist data/configurations mount either a volume container or a local folder to `/opt/alliance/data`

## Configuration

To configure the system mount a volume container or local folder to `/opt/alliance/etc`

## Deploying bundles

To deploy bundles that are not packaged with the Alliance distribution mount a volume container or local folder to `/opt/alliance/deploy`

## Customizing Setup

Currently this container provides a custom entrypoint that has two hooks for pre-start and post start configuration.

To apply custom configuration steps before startup, mount a script via docker volumes to `/opt/entrypoint/pre_start.sh`

To apply custom configuration steps after startup, mount a script via docker volumes to `/opt/entrypoint/post_start.sh`

### Exposed Ports

|Port|Purpose        |
|:--:|:-------------:|
|8101| Alliance SSH server|
|8181| http          |
|8993| https         |
