window.addEventListener('message', function(event) {
    let data = event.data
    if (event.data.type == 'show') {
        $(".circle").html(data.input);
        $(".text").html(data.text);
        $("body").fadeIn();
    }

    if (event.data.type == 'hide') {
        $("body").fadeOut();
    }
})
