<%@ Page Language="C#" %>

<%@ Import Namespace="edu.neu.ccis.rasala" %>

<!DOCTYPE html>
<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <script runat="server">
 
        // below is the code from Prof. Rasala's key hiding application.
        const string keyidentifier1 = "goodreads";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                id1.Value = KeyTools.GetKey(this, keyidentifier1);
            }
        }</script>
    <title>BookHaven</title>
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <link rel="icon" type="image/png" href="../images/book-icon1.jpg" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
    <script type="text/javascript">

        var author_name;
        var author;
        var srch;
        var aid;
        var formatteddata = '';
        // Getting the key and passing it as param.
        function onload() {
            var grkey = $('#id1').val();
            var param = {
                "author_name": "<%= Request.Params["a_name"] %>",
                "key": grkey
            };
            // passing the param as input for handler
            $.ajax({
                type: "POST",
                url: "AuthorSearchHandler.ashx",
                data: param,
                success: displayAuthorDetails,
                error: function () {
                    $('#searchAuthorResults').append("<br/><center><h2>The API is not responding right now..Please try again later..</h2></center>");
                }
            });
        }

        // Display author details
        function displayAuthorDetails(xmldata, status) {
            author = xmldata.getElementsByTagName('author');
            for (var i = 0; i < author.length; i++) {
                aid = author[i].getAttribute('id');
            }
            if (aid != '') {
                var a_name;
                var a_desc;
                var a_dob;
                var a_hometown;
                var a_img_url;
                var grkey = $('#id1').val();
                // Getting the key and passing it to Handler
                $.ajax({
                    url: "AuthorDetailsHandler.ashx",
                    type: "POST",
                    data: { "author_id": aid, "key": grkey },
                    success: format_data,
                    error: function () {
                        var message = "<br/><center><h2>The API is not responding right now..Please try again later..</h2></center>";
                        $("#searchAuthorResults").append(message);
                    }
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
                    formatteddata += '<b>Home Town : </b>' + a_hometown + '</br></br>';
                    formatteddata += '<b><a href="author_books.aspx?aid=' + aid + '" id="authBookLink" target="_blank">Books by this Author</a></b><br/><br/>';
                    formatteddata += '<br/><div id="desc">' + a_desc + '</div></div></div></center>';
                    formatteddata += '<div class="clear"></div>';

                    $("#searchAuthorResults").append(formatteddata);
                }
            }
            else {
                var message = "<div id='messageID'><div>No author found. Please try for another author.</h2></div>";
                $("#searchAuthorResults").append(message);
            }

        }


    </script>
</head>
<body id="authorbg" onload="onload()">

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

            <div id="detailsBlock2">
                <!--Input hidden , so that User cant look for key -->
                <input type="hidden" id="id1" runat="server"></input>
                <br />
                <h1>Author Details</h1>
                <br />
                <!--Div for loading Author Search Results-->
                <div id="searchAuthorResults">
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

