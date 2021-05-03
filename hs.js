var item = require('hotshell').item

item(
    {desc: 'top level menu'},
    function () {
        item(
            {key: 'p',  desc: 'gPick colour picker', wd: './'},
            function() {
                item({key: 'p', desc: 'Pick colour', cmd: 'gpick -p && pkill --signal SIGTERM hs'});
                item({key: 'w', desc: 'gPick window', cmd: 'setsid gpick'});
            }
        );
        item(
            {key: 'k',  desc: 'KDE', wd: './'},
            function() {
                item({key: 'k',  desc: 'KDE system settings', cmd: 'kstart5 systemsettings5 2>/dev/null &'});
                item({key: 'q',  desc: 'quit'               , cmd: 'pkill --signal SIGTERM hs'});
                item({key: "", desc: 'quit'               , cmd: 'pkill --signal SIGTERM hs'});
            });
        item({key: 'r',  desc: 'reading list'       , wd: './', cmd: 'lxterm -e "bash --norc -c rlistrun" &'})
        item({key: 's',  desc: 'XFCE screenshot'    , wd: './', cmd: 'setsid xfce4-screenshooter &'});
        item({key: 'q',  desc: 'quit'               , wd: './', cmd: 'pkill --signal SIGTERM hs'});
        item({key: "", desc: 'quit'               , wd: './', cmd: 'pkill --signal SIGTERM hs'});
    });
