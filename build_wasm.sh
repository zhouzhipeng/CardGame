#!/bin/bash

name=CardGame

# web_sys_unstable_apis is required to enable the web_sys clipboard API
# https://rustwasm.github.io/wasm-bindgen/api/web_sys/struct.Clipboard.html
export RUSTFLAGS=--cfg=web_sys_unstable_apis
features=glyph,egui,text,extra,audio,links,drop_files,clipboard,save_file,texture_to_file


cargo build --target wasm32-unknown-unknown --release  --features=$features
wasm-bindgen ./target/wasm32-unknown-unknown/release/${name}.wasm --out-dir ./web --no-modules --browser
wasm-opt -O -o ./web/${name}_bg.wasm ./web/${name}_bg.wasm

gzip -f ./web/${name}_bg.wasm
gzip -f ./web/${name}.js

cp -R ./assets ./web/assets
