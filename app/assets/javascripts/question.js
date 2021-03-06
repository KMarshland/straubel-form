
function initializeQuestion(opts) {

    var id = opts.id;
    var name = opts.name;

    var parent = document.getElementById(id);
    var input = parent.getElementsByTagName('input')[0] || parent.getElementsByTagName('textarea')[0];

    if (opts.required) {
        document.getElementById('submit-button').disabled = true;
    }

    parent.addEventListener('mousedown', function () {
        createEvent({
            kind: 'questionClick',
            question: name
        })
    }, false);

    if (opts.required) {
        input.addEventListener('blur', function () {
            if (input.value) {
                document.getElementById('submit-button').disabled = false;
            } else {
                document.getElementById('submit-button').disabled = true;
            }
        }, false);
    }

    if (opts.type === 'rank') {
        var listEl = parent.getElementsByTagName('ul')[0];
        window.listEl = listEl;

        var updateValues = function () {
            var result = [];
            for (var i = 0; i < listEl.children.length; i++) {
                var li = listEl.children[i];

                if (li.className.split(' ')[0] === 'other') {
                    var otherValue = li.getElementsByTagName('input')[0].value;
                    if (otherValue) {
                        result.push(otherValue);
                    }
                } else {
                    result.push(li.innerText);
                }
            }

            input.value = JSON.stringify(result);
        };

        updateValues();

        Sortable.create(listEl, {
            onUpdate: updateValues
        });

        var otherEl = listEl.getElementsByClassName('other')[0];
        if (otherEl) {
            otherEl.getElementsByTagName('input')[0].addEventListener('change', updateValues);
        }
    } else if (opts.type === 'checkbox') {
        var otherEl = parent.getElementsByClassName('other')[0];
        var checkbox = otherEl.getElementsByTagName('input')[0];
        var otherInput = otherEl.getElementsByTagName('input')[1];
        var updateCheckbox = function () {
            if (otherInput.value) {
                checkbox.value = otherInput.value;
                checkbox.checked = true;
            } else {
                checkbox.checked = false;
            }
        };

        otherInput.addEventListener('keyup', updateCheckbox);
        otherInput.addEventListener('change', updateCheckbox);
    }
}


