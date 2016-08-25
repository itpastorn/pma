## About

Simple shell script that automatically installs the latest version of PhpMyAdmin
on a Laravel Homestead box. Adapted for my book Webbserverprogrammering 1

## Hur du använder detta

1. Se till att du installerat VirtualBox, Vagrant och Homestead Improved enligt anvinsningarna i boken

2. När din Homestead maskin är igång, skriv `vagrant ssh`

3. `$ curl -sS https://raw.githubusercontent.com/itpastorn/pma/master/pma.sh | sh`

4. Öppna `hosts` på din värddator och lägg till raden:
```192.168.10.10  phpmyadmin.app```

5. Gå till [http://phpmyadmin.app](http://phpmyadmin.app). Ange användarnamnet `Homestead` och lösenordet `secret`.

## License

The MIT License (MIT). Please see [License File](LICENSE.md) for more information.
Originalet finns på https://github.com/grrnikos/pma
