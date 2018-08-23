var item = require('hotshell').item

item({desc: 'top level menu'}, function () {

    item({key: 'p', desc: 'gPick colour picker', wd: './', cmd: 'gpick && exit'})
    item({key: 's', desc: 'XFCE screenshot'    , wd: './', cmd: 'xfce4-screenshooter && exit'})
})
