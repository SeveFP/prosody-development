# Prosody docker setup

#### Rationale
The purpose of this project is to have a way to quickly spin up a Prosody instance
for client development. 


#### Setting up
```
echo "127.0.0.1 example.org" | sudo tee -a /etc/hosts
git clone git@github.com:SeveFP/prosody-development.git
cd prosody-development/
docker-compose up
```
BOSH is enabled by default to work locally.  
Community modules are also available but need to be enabled individually.  
Simply add the required modules in [modules_enabled](https://github.com/SeveFP/prosody-development/blob/master/configuration/prosody.cfg.lua#L38)
and run `docker-compose up --build` to have them enabled.


#### Connecting from an XMPP client
Two users are created after setting up the container that can be used straight away for testing:
```
User1 (admin)------------
address: alice@example.org
password: 1234
User2--------------------
address: bob@example.org
password: 1234
```
