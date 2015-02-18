$(function(){
    $('li[data-type="collapsible"]').hide();

    $('li[data-type="collapser"]').click(function(){
        var data_toggle = $(this).attr('data-toggle');
        $('li[data-type="collapsible"][data-toggle="'+ data_toggle + '"]').slideDown();
        setTimeout(function(){
            $('li[data-type="collapsible"][data-toggle="'+ data_toggle + '"]').slideUp();
        },7000)
        return false;
    })
});



