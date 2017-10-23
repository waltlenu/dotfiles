#!/usr/bin/env bash

if [ -z "$1" ]; then
  exec /usr/bin/env bash
else
  exec "$@"
fi
