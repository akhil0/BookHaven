var author_name;
var author;
var srch;
var aid;
var formatteddata = '';



$(document).ready(function () {
    
    $('button').click(function () {
        $('#searchAuthorResults').empty();
        formatteddata = '';
        srch = $('#searchTextbox').val();
        var grkey = $('#id1').val();
        author_name = srch.trim();
       
        $.ajax({
            type: "POST",
            url: "AuthorSearchHandler.ashx",
            data: { "author_name": encodeURI(author_name), "key": grkey },
            success: displayAuthorDetails,
            error: function () {
                $('#searchAuthorResults').append("<br/><center><h2>No author found for this input. Please try for another name.</h2></center>");
            }
        });
    });

    $('#searchTextbox').keydown(function (e) {
        var key = e.charCode ? e.charCode : e.keyCode ? e.keyCode : 0;
        if (key == 13) {
            e.preventDefault();
            $('#searchAuthorResults').empty();
            formatteddata = '';
            srch = $('#searchTextbox').val();
            var grkey = $('#id1').val();
            author_name = srch.trim();
            //$('#search').val("");

            $.ajax({
                type: "POST",
                url: "AuthorSearchHandler.ashx",
                data: { "author_name": encodeURI(author_name), "key": grkey },
                success: displayAuthorDetails,
                error: function () {
                    $('#searchAuthorResults').append("<center><div id='messageID'>No author found for this input. Please try for another name.</div></center>");
                }
            });
        }
    });
});


function displayAuthorDetails(xmldata, status) {

    author = xmldata.getElementsByTagName('author');
    for (var i = 0; i < author.length; i++) {
        aid = author[i].getAttribute('id');
    }
    if (typeof aid != 'undefined') {
        var a_name;
        var a_desc;
        var a_dob;
        var a_hometown;
        var a_img_url;

        $(document).ready(function () {
            var grkey = $('#id1').val();
            $.ajax({
                url: "AuthorDetailsHandler.ashx",
                type: "POST",
                data: { "author_id": aid, "key": grkey},
                success: format_data,
                error: function () {
                    var message = "<br/><center><div id='messageID'>No author found for this input. Please try for another name.</div></center>";
                    $("#searchAuthorResults").append(message);
                }
            });
        });

        function format_data(xmldata, status) {
            a_desc = $(xmldata).find('about').first().text();
            a_name = $(xmldata).find('name').first().text();
            a_dob = $(xmldata).find('born_at').first().text();
            a_img_url = $(xmldata).find('image_url').first().text();
            a_hometown = $(xmldata).find('hometown').first().text();

            show_details();
        }

        function show_details() {

            formatteddata += '<center><div id="author_info"><div id="author_name"><h3>' + a_name + '</h3></div>';
            formatteddata += '<div id="author_image"><img src="' + a_img_url + '" id="a_image"/></div>';
            formatteddata += '<div id="author_dob"><b>Date Of Birth : </b>' + a_dob + '</br>';
            formatteddata += '<b>Home Town : </b>' + a_hometown + '</br>';
            formatteddata += '<b><a href="author_books.aspx?aid=' + aid + '" target="_blank" id="authBooksLink">Books by this Author</a></b><br/>';
            formatteddata += '<div id="desc">' + a_desc + '</div></div></div></center>';
            formatteddata += '<div class="clear"></div>';

            $("#searchAuthorResults").append(formatteddata);
        }
    }
    else {
        var message = "<center><div id='messageID'>No author found for this input. Please try for another name.</div></center>";
        $("#searchAuthorResults").append(message);
    }

}
