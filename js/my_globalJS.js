var jWidth = $(document).width();
var jHeight = $(document).height();

$('#myIframe').width(jWidth);
$('#myIframe').height(jHeight);

function aClickFunc(obj) {
    var target = $(obj).attr('page');
    $('#myIframe').attr('src', target);
    $('#sidebar>ul>li>ul>li').each(function () {
        if ($(this).find('li').length == 0) {
            $(this).removeClass('current');
        }
    })
    $(obj).parent().attr('class', 'current');
}