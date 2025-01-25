var item = require("hotshell").item;

item(
    {desc: "top level menu"}, function () {
        item({key: "c",  desc: "calc", wd: "./"},
            function() {
                item({key: "c",  desc: "gcalc", cmd: "kstart5 gcalc 2>/dev/null &"});
                item({key: "p",  desc: "python"}, function() {
                    item({key: "l",  desc: "pylab", cmd: "roxterm -e ipython --pylab -i ~/.pylab 2>/dev/null&"});
                    item({key: "p",  desc: "idle", cmd: "kstart5 idle 2>/dev/null &"});
                    item({key: "", desc: "quit", cmd: "pkill --signal SIGTERM hs"});
                });
                item({key: "", desc: "quit", cmd: "pkill --signal SIGTERM hs"});
            });
        item({key: "k",  desc: "KDE", wd: "./"}, function() {
            item({key: "k",  desc: "KDE system settings", cmd: "kstart5 systemsettings5 2>/dev/null &"});
            item({key: "q",  desc: "quit"               , cmd: "pkill --signal SIGTERM hs"});
            item({key: "", desc: "quit"               , cmd: "pkill --signal SIGTERM hs"});
        });
        item({key: "p",  desc: "gPick colour picker", wd: "./"}, function() {
            item({key: "p", desc: "Pick colour", cmd: "gpick -p && pkill --signal SIGTERM hs"});
            item({key: "w", desc: "gPick window", cmd: "setsid gpick"});
        });
        item({key: "q",  desc: "quit"               , wd: "./", cmd: "pkill --signal SIGTERM hs"});
        item({key: "r",  desc: "reading list"       , wd: "./", cmd: "lxterm -e 'bash --norc -c rlistrun' &"});
        item({key: "s",  desc: "XFCE screenshot"    , wd: "./", cmd: "setsid xfce4-screenshooter &"});
        item({key: "t",  desc: "htop"               , wd: "./", cmd: "roxterm -e htop 2>/dev/null&"});
        item({key: "", desc: "quit"               , wd: "./", cmd: "pkill --signal SIGTERM hs"});
    });
