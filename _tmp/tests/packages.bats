#!/usr/bin/env bats

@test "BASH installed" {
  run apk info -eq bash
  [ "$status" -eq 0 ]
}

@test "cURL installed" {
  run apk info -eq curl
  [ "$status" -eq 0 ]
}

@test "BATS 0.4.0 installed" {
  run bats --version
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "Bats 0.4.0" ]
}
