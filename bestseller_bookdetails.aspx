<%@ Page Language="C#" %>

<%@ Import Namespace="edu.neu.ccis.rasala" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>BookHaven</title>
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <link rel="icon" type="image/png" href="../images/book-icon1.jpg" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
    <script type="text/javascript">
        var formatteddata = '';
        function onload() {
            document.getElementById('bestsellerDetails').innerHTML = '';
            //Creating param and passing to Handler
            var param = {
                "category": "<%= Request.Params["category"] %>",
                "isbn": "<%= Request.Params["isbn"] %>",
                "key": "8738efc84c5687f351c52faff8bc4a92:11:71778832"
            };
            var image = "<%= Request.Params["image"] %>";
            $.ajax({
                url: "BestsellerDetailsHandler.ashx",
                type: "POST",
                data: param,
                success: function (response) {
                    format_data(response, image);
                },
                error: function (xhr, status, err) {
                    document.getElementById('bestsellerDetails').innerHTML = '<br/><center><h2>The API is not responding right now..Please try again later..</h2></center>';
                }
            });
        }
        //Format the response data from XML
        function format_data(xmldata, image) {
            console.log(xmldata);
            var formatted_image = '<span style="float:left; height:100%; width:20%;" id="bImageDiv"><img src="' + image + '" width="200" height="250"/></span>';
            formatteddata += '<span style="float: right; width:70%;" id="bstsllrBookData">';
            var book_title = $(xmldata).find('title').first().text();
            formatteddata += 'Title: ' + book_title + '<br/><br/>';
            var book_author = $(xmldata).find('author').first().text();
            formatteddata += 'Author: ' + book_author + '<br/><br/>';
            var book_desc = $(xmldata).find('description').first().text();
            formatteddata += 'Description: ' + book_desc + '<br/><br/>';;
            var book_pub = $(xmldata).find('publisher').first().text();
            formatteddata += 'Publisher: ' + book_pub + '<br/><br/>';
            var book_price = $(xmldata).find('price').first().text();
            if (book_price > 0) {
                formatteddata += 'Price: ' + book_price + ' USD <br/><br/>';
            }
            formatteddata += '</span>';
            document.getElementById('bestsellerDetails').innerHTML = formatted_image + formatteddata;

        }
    </script>
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
                <input type="hidden" id="id1" runat="server"></input>
                <br />
                <h1 id="bstsllrDetailsHead">BestSellers Books</h1>
                <div id="detailsBlock2">
                     <!--Div for loading Bestseller Details-->
                    <div id="bestsellerDetails">
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

