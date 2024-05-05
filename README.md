## local dev
```bash
# first time install trunk : cargo install trunk
./local_dev.sh
```

## prod release
```bash
./build_wasm.sh

```
> then use files in `web` folder
> update `web/index.html` for production not `index.html` under root folder.


## project structure

* `assets`   game resources
* `dist`  a temp directory for local dev
* `src`  rust code
* `web`  a temp directory for production build.