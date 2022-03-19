# Reduce Production Downtime

## Setup Nginx
- Setup nginx upstream with primary and backup server
- If primary server failed to server the request then backup server will call.

## Hot Reload
- Run `./hot-reload.sh`

## Pros
- No request will failed.
- User won't get any downtime.

## Cons
- While primary service was down then pending request on primary server will partially effect on database operation(This will also happen on regular update).
- User will get slow response since it's failed and try system. It will take time to first failed deepend on `fail_timeout=10s` on nginx.
