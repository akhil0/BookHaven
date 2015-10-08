
var text;
var title;
var obj;
var JSONResponse;
var APIurl;
$(document).ready(function () {

    $("#search_button").click(function () {

        document.getElementById('searchResults').innerHTML = "";

        title = $("input#textbox1").val().trim();
        CallAPI(title);
    });

    $('input#textbox1').keydown(function (e) {
        var key = e.charCode ? e.charCode : e.keyCode ? e.keyCode : 0;
        if (key == 13) {
            e.preventDefault();
            document.getElementById('searchResults').innerHTML = "";

            title = $("input#textbox1").val().trim();
            CallAPI(title);
        }
    });
});

function CallAPI(title) {
    var param = {q: title};
    $.ajax({
        url: "https://www.googleapis.com/books/v1/volumes?",
        data: param, 
        dataType: "jsonp",
        success: function (response) {
            format_data(response);
        },
        error:function(xhr,status,err){
            document.getElementById('searchResults').innerHTML = '<br/><center><h2>The API is not responding right now..Please try again later..</h2></center>';
        }
});
}

function format_data(JSONResponse) {

    var items = JSONResponse.items;
    
    if (typeof items != 'undefined') {

        var number_of_items = JSONResponse.items.length;

        var id;

        var theader = "<center><div class='bookTable'><table id='myTable' >";
        var tbody = "";
        theader += "<th>Image</th>";
        theader += "<th>Title</th>";
        theader += "<th>Author</th>";

        for (var i = 0; i < number_of_items; i++) {

            id = JSONResponse.items[i].id;

            tbody += "<tr>";

            var obj1 = JSONResponse.items[i].volumeInfo.imageLinks;

            var previewLink = "book_details.aspx?id=" + id;
            if (typeof obj1 != 'undefined') {
                var thumbNail = JSONResponse.items[i].volumeInfo.imageLinks.thumbnail;
                var thumbNailProcessed = "<img src=" + thumbNail + " id='bookImages'>";
                tbody += "<td><a href=" + previewLink + " target='_blank'>";
                tbody += thumbNailProcessed;
                tbody += "</a></td>";
            }
            else {
                var no_image = "<img src='../images/no_thumbnail.jpg' id='noImage1'/>";
                tbody += "<td>" + no_image + "</td>";
            }
            tbody += "<td>";

            text = JSONResponse.items[i].volumeInfo.title;
            var book_name = text;
            tbody += "<a href=" + previewLink + " target='_blank' id='bookTitle1'>" + book_name + "</a>";
            tbody += "</td>";

            var obj2 = JSONResponse.items[i].volumeInfo.authors;
            var authorlink = "";
            if (typeof obj2 != 'undefined') {
                tbody += "<td>";
                var aname = "";
                for (var j = 0; j < JSONResponse.items[i].volumeInfo.authors.length; j++) {
                    authorlink += "<a href='author_info.aspx?a_name=";
                    aname = JSONResponse.items[i].volumeInfo.authors[j];
                    authorlink += aname + "' id='authLink' target='_blank'>" + aname + "</a><br/>";
                }

                tbody += authorlink;
                tbody += "</td>";
            }

            tbody += "</tr>";
        }
        var tfooter = "</table></div></center>";

        document.getElementById('searchResults').innerHTML = theader + tbody + tfooter;
    }
    if (typeof items == 'undefined')
    {
        document.getElementById('searchResults').innerHTML = "<br/><h2 id='nobookHead'>No books found matching your entry. Please try a different name.</h2><br/>";
    }
}

