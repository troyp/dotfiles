var item = require('hotshell').item

item({desc: 'top level menu'}, function () {

    item({key: 'p', desc: 'gPick colour picker', wd: './', cmd: 'gpick && exit'})
    item({key: 's', desc: 'XFCE screenshot'    , wd: './', cmd: 'xfce4-screenshooter && exit'})

    // a description can be used to clarify the command intent
    item({key: 'a', desc: 'access logs', cmd: 'less +F /var/log/apache2/access.log'})
    item({key: 'e', desc: 'error logs', cmd: 'less +F /var/log/apache2/error.log'})
})
