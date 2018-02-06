
function initializeQuestion(opts) {

    var id = opts.id;
    var name = opts.name;

    var parent = document.getElementById(id);
    var input = parent.getElementsByTagName('input')[0] || parent.getElementsByTagName('textarea')[0];

    // input.addEventListener('focus', function () {
    //     createEvent({
    //         kind: 'questionFocus',
    //         question: name
    //     })
    // }, false);
    //
    // input.addEventListener('blur', function () {
    //     if (input.value) {
    //         createEvent({
    //             kind: 'questionFill',
    //             question: name
    //         });
    //     }
    //
    //
    //     createEvent({
    //         kind: 'questionBlur',
    //         question: name
    //     });
    // }, false);

    if (opts.type === 'rank') {
        Sortable.create(parent.getElementsByTagName('ul')[0]);
    }
}


