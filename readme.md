# Pro Pilkki 2 Docker contained server solution 🧊🎏

## Setup and run

Edit `pp2host.conf` -file to setup your passwords.

Edit `autohost.ini` -file to setup your fishing settings and lakes and stuff.

Build image:

`docker build -t propilkki2server .`

Run container:

`docker run --name pilkki --rm -i -p 4500:4500 -td propilkki2server`

Stop pilkkiminen:

`docker stop -t 0 pilkki`

## Development

Open interactive shell for debugging purposes:

`docker exec -it pilkki bash`

Nifty way to debug failed startups is to add `sleep TIME` -command at the end of launch.sh -script so the container keeps running and you can log in via shell to see what happened.

## Additional information

Commands which can be used by administrator inside the game:

http://pp2.propilkki.net/komennot/

How to join a network game:

http://propilkki.net/pp2opas/index.php?sivu=liityvp

ProPilkki server also has some http administrator panel which should respond from http://localhost:4500/Admin.html
