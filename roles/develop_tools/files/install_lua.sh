#!/usr/bin/env bash

mkdir /tmp/lua

# Lua
mkdir -p /opt/lua/5.1.5
curl -o /tmp/lua/lua-5.1.5.tar.gz http://www.lua.org/ftp/lua-5.1.5.tar.gz
tar -zxvf /tmp/lua/lua-5.1.5.tar.gz -C /tmp/lua/

cd /tmp/lua/lua-5.1.5

sed -i -e 's/\/usr\/local/\/opt\/lua\/5.1.5/g' /tmp/lua/lua-5.1.5/Makefile
sudo make install

# Lua Rocks
curl -o /tmp/lua/luarocks-3.0.4.tar.gz https://luarocks.github.io/luarocks/releases/luarocks-3.0.4.tar.gz
tar -zxvf /tmp/lua/luarocks-3.0.4.tar.gz -C /tmp/lua/

cd /tmp/lua/luarocks-3.0.4

./configure --prefix=/opt/lua/5.1.5 --lua-suffix=5.1 --lua-version=5.1 --with-lua=/opt/lua/5.1.5 --with-lua-include=/opt/lua/5.1.5/include --with-lua-lib=/opt/lua/5.1.5/lib

sudo make build
sudo make install

# Links

ln -s /opt/lua/5.1.5/bin/lua /usr/bin/lua5.1
ln -s /opt/lua/5.1.5/bin/luarocks /usr/bin/luarocks5.1


