<%@ Page Language="C#" %>

<%@ Import Namespace="edu.neu.ccis.rasala" %>


<!DOCTYPE html>

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>BookHaven</title>
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
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <link rel="icon" type="image/png" href="../images/book-icon1.jpg" />
    <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript">
        var i = 0;
        var book_author, book_author_id;
        var formatteddata = '';
        var formattedimage = '';
        function onload() {
            var grkey = $('#id1').val();
            var param = {
                "book_id": "<%= Request.Params["bid"] %>",
                "key": grkey
            };
            $.ajax({
                url: "SimBookDetailsHandler.ashx",
                data: param,
                success: displaySimBookDetails,
                error: function (xhr, status, err) {
                    document.getElementById('detailsBlock2').innerHTML = '<br/><center><h2>The API is not responding right now..Please try again later..</h2></center>';
                }
            });

        }

        function displaySimBookDetails(xmldata) {

            var book_title = $(xmldata).find('title').first().text();
            var book_desc = $(xmldata).find('description').first().text();
            var book_rating = $(xmldata).find('average_rating').first().text();
            var book_image = $(xmldata).find('image_url').first().text();
            //author??
            formattedimage += '<div id="book_image"><img src="' + book_image + '" id="simBookImage"/></div>';
            formatteddata += '<div id="book_details"><b>Title:  </b>' + book_title;
            formatteddata += '<br/><b>Average Rating:  </b>' + book_rating;
            if (book_desc != '')
            { formatteddata += '<br/><br/><b>Description:  </b><br/>' + book_desc + '<br/></div>'; }
            else
            { formatteddata += '<br/><br/>No description found for this book.</div>'; }
            document.getElementById('detailsBlock2').innerHTML = formattedimage + formatteddata;
        }

    </script>
</head>
<body onload="onload()" id="booksbg">

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
                <h1 id="bookDetailsHead">Book Details</h1>
                <div id="detailsBlock2">
                </div>
            </div>
        </div>
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
