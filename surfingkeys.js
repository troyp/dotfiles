
map('<Ctrl-x><Ctrl-c>', ':quit');

unmap('x');
mapkey('d', '#3Close current tab', function() {
    RUNTIME("closeTab");
});

map('h', 'E');
map('l', 'R');
mapkey('<Alt-j>', '#2Scroll right', ()=>Normal.scroll("right"));
mapkey('<Alt-k>', '#2Scroll left',  ()=>Normal.scroll("left"));

map('<Alt-;>', '<Ctrl-6>');

mapkey('C', '#3Duplicate current tab', ()=>RUNTIME("duplicateTab"));
