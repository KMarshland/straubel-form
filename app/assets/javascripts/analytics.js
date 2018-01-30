
function createEvent(event) {

    if (!event) {
        throw 'event must be provided'
    }

    if (!event.kind) {
        throw 'event.kind must be provided'
    }

    event.time = event.time || new Date();
    event.session = document.getElementById('session_id').content;
    event.view = document.getElementById('view_id').content;

    console.log('Sending event', event);

    var encodedEvent = [];
    for (var key in event) {
        if (event.hasOwnProperty(key)) {
            encodedEvent.push('event[' + key + ']=' + event[key]);
        }
    }

    Rails.ajax({
        url: '/events',
        type: 'POST',
        data: encodedEvent.join('&')
    });

}
