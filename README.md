## local dev
```bash
# first time install trunk : cargo install trunk
trunk serve
```

## prod release
```bash
./build_wasm.sh

```
> then use files in `web` folder
> update `web/index.html` for production not `index.html` under root folder.