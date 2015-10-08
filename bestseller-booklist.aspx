<%@ Page Language="C#" %>

<!DOCTYPE html>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>

<script type="text/javascript">
    // Pasing the param
    var formatteddata = '';
    function onload() {
        document.getElementById('bestsellerBookDetails').innerHTML = '';
        var param = {
            "title": "<%= Request.Params["term"] %>",
            "key": "8738efc84c5687f351c52faff8bc4a92:11:71778832"
        };
        // Passing to Handler
        var category = "<%= Request.Params["term"] %>";
        $.ajax({
            url: "BestSellerHandler.ashx",
            type: "POST",
            data: param,
            success: function (response) {
                format_data(response, category);
            },
            error: function (x, e) {
                document.getElementById('bestsellerBookDetails').innerHTML = '<br/><center><h2>The API is not responding right now..Please try again later..</h2></center>';
            }
        });

    }

    //Format the response XML data.
    function format_data(xmldata, category) {
        var book = $(xmldata).find('book').each(function () {
            var book_title = $(this).find('title').first().text();
            var book_image = $(this).find('book_image').first().text();
            var book_isbn = $(this).find('isbn13').first().text();
            formatteddata += '<div id="bookBlock">';
            var no_image = "<img src='no_thumbnail.jpg' id='noImage2'/>";
            if (book_image == '') {
                formatteddata += no_image;
            }
            else {
                formatteddata += '<div id="bstsllrImageDiv">';
                formatteddata += '<a href="bestseller_bookdetails.aspx?isbn=' + book_isbn + '&category=' + category;
                formatteddata += '&image=' + book_image + '" target="_blank">';
                formatteddata += '<img src="' + book_image + '" id="bstsllrImage" width="200" height="300"/></a></div>';
            }

            formatteddata += '<div id="bstsllrTitleDiv">';
            formatteddata += '<a href="bestseller_bookdetails.aspx?isbn=' + book_isbn + '&category=' + category + '" id="bstsllrTitle" target="_blank">';
            formatteddata += book_title + '</a></div></div><hr/>';
        });
        document.getElementById('bestsellerBookDetails').innerHTML = formatteddata;
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>BooHaven</title>
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <link rel="icon" type="image/png" href="../images/book-icon1.jpg" />
</head>
<body onload="onload()" id="bestbooksbg">

    <center>
<div class="container"></div> 
<div class="nav-holder">
  <div class="nav">
    <div class="navcon"><a href="home.aspx">Home</a></div> 
    <div class="navcon"><a href="search_books.aspx">Book Search</a></div>
    <div class="navcon"><a href="search_authors.aspx">Author Search</a></div>
    <div class="navcon"><a href="bestseller.aspx">NYT Best Sellers</a></div>
      <div class="navcon"><a href="mylist.aspx">My List</a></div>
	<div class="navcon"><a href="../story/index.htm?../documentation/story.txt">Documentation</a></div>
  </div>
</div>
    </center>

    <div class="content">
        <div class="article">
            <div>
                <br />
                <h1 id="bookDetailsHead">BestSellers Books</h1>
                <div id="detailsBlock2">
                     <!--Div for loading Bestseller Book Details-->
                    <div id="bestsellerBookDetails">
                    </div>
                </div>
            </div>
        </div>
        <!--Footer-->
        <div class="footer_div">
            <footer>
                Data courtesy: GoodReads, NYT, and Google
                <br />
                &copy; 2015 K.Akhil. All rights reserved.
            </footer>
        </div>
    </div>
</body>
</html>
