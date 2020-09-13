#!/bin/sh

set -e

user1="alice"
user2="bob"
host="example.org"
password="1234"

if [ ! -f .initialized ]; then
    echo "First time initialization..."
    prosodyctl cert generate example.org
    prosodyctl cert generate chat.example.org
    prosodyctl register ${user1} ${host} ${password}
    prosodyctl register ${user2} ${host} ${password}
    touch .initialized
fi

echo ""
echo "------------USER ACCOUNTS------------------------------------"
echo "User1 (admin): ${user1}@${host} password: ${password}"
echo "User2: ${user2}@${host} password: ${password}"
echo "-------------------------------------------------------------"
echo ""
runuser -u prosody -- "$@"
