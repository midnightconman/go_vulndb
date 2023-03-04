# go_vulndb

A copy of the go vulnerabilities database in github, with weekly automatic updates.

## Usage

The primary usage of this repo at creation time was to use as a file input for the [`govulncheck`](https://pkg.go.dev/golang.org/x/vuln/cmd/govulncheck) tool. We use bazel for all our builds, so we needed a way to "ship" the vulnerabilities database as an external dependency.

## Automatic Tag Updates

This repository has a github actions workflow, which is scheduled to run via the following cron `12 0 * * 0`. This means every week [vuln.go.dev](https://vuln.go.dev) is scraped and any changes are automatically commited and tagged.
