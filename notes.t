Horizon Flow Notes:
* Running npm install in toplevel directory fails in a weird way.
* README doesn't make it clear that installation instructions are for
  npm package rather than source.

* Make `--connect` should set `start_rethindb` to false.

---

export npm_config_prefix=/home/mlucy/local/npm-modules
cd client
npm install
cd ../server
npm link ../client
npm install
cd ../cli
npm link ../server
npm install
cd ..
node cli/src/main.js init mtest
cd mtest

cd client
npm install
cd ../server
sudo npm link ../client
sudo chown -R mlucy:mlucy node_modules
npm install
cd ../cli
sudo npm link ../server
sudo chown -R mlucy:mlucy node_modules
npm install
cd ..
node cli/src/main.js init mtest
cd mtest


---

RethinkDB TODO:
* Look into segfault building `next` in release mode with g++ on fusion server.

Fusion TODO:
* Backups.

TODO:
* Automatically set GOPATH in eshell.
export GO15VENDOREXPERIMENT=1
export GOPATH=/home/mlucy/go

Emacs:
* Make goimports run before saving.
* Make tab-width be 2 in go files `(setq tab-width 2)`.
* Load go mode automatically for `.go` files.
* Auto install go-mode if not present.
* (setq gofmt-command "goimports")
* (add-hook 'before-save-hook 'gofmt-before-save)
* Make the above not edit history.
* subword-mode

(setq tab-width 2)
(setq gofmt-command "goimports")
(add-hook 'before-save-hook 'gofmt-before-save)
(subword-mode)

Commands:
go get -u -v github.com/aws/aws-sdk-go/...
netstat -tlnp

---

Monitoring.

---

Using `runit` package.
  - runsv (supervisor)
  - /etc/services/rethinkdb (`mv` in)
  - `sv` command to interact, check status, etc. (`sv status rethinkdb`)
  - Can touch /etc/services/rethinkdb/down to mark service as normally down
