## About

Simple shell script that automatically installs the latest version of PhpMyAdmin
on a Laravel Homestead box. Adapted for my book Webbserverprogrammering 1

## Hur du använder detta

1. Se till att du installerat VirtualBox, Vagrant och Homestead Improved enligt anvisningarna i boken och med hjälp av [tillhörande projekt här på GitHub](https://github.com/itpastorn/webbutveckling-1-flex-studentfiles)

2. När din Homestead maskin är igång, skriv `vagrant ssh`

3. `$ curl -sS https://raw.githubusercontent.com/itpastorn/pma/master/pma.sh | bash`

4. Öppna `hosts` på din värddator och lägg till raden:
```192.168.10.10  phpmyadmin.app```

5. Gå till [http://phpmyadmin.app](http://phpmyadmin.app). Ange användarnamnet `Homestead` och lösenordet `secret`.

## License

The MIT License (MIT). Please see [License File](LICENSE.md) for more information.
Originalet finns på https://github.com/grrnikos/pma
