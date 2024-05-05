#!/bin/bash
set -eux

rm -rf ./web
mkdir -p ./web

name=CardGame

# web_sys_unstable_apis is required to enable the web_sys clipboard API
# https://rustwasm.github.io/wasm-bindgen/api/web_sys/struct.Clipboard.html
export RUSTFLAGS=--cfg=web_sys_unstable_apis


cargo build --target wasm32-unknown-unknown --release
wasm-bindgen ./target/wasm32-unknown-unknown/release/${name}.wasm --out-dir ./web --no-modules --browser
wasm-opt -O -o ./web/${name}_bg.wasm ./web/${name}_bg.wasm

cp index_prod.html ./web/index.html

