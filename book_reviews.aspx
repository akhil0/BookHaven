<%@ Page Language="C#" %>

<%@ Import Namespace="edu.neu.ccis.rasala" %>

<!DOCTYPE html>

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
    <title>Bookhaven</title>
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <link rel="icon" type="image/png" href="../images/book-icon1.jpg" />
    <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript">
        var formatted_review;

        function onload() {
            document.getElementById("reviewBlock").innerHTML = "";
            formatted_review = '';
            var grkey = $('#id1').val();
            //Hidden Key is passed as param
            var param = {

                "title": "<%= Request.Params["title"] %>",
                "key": grkey
            };
            $.ajax({
                type: "POST",
                url: "BookReviewHandler.ashx",
                data: param,
                success: displayBookReviews,
                error: function () {
                    document.getElementById('reviewBlock').innerHTML = '<br/><center><h2>The API is not responding right now..Please try again later..</h2></center>';
                }
            });
        }
        // Formatting the response data
        function displayBookReviews(xmldata, status) {
            var review = $(xmldata).find('reviews_widget').first().text();
            formatted_review += review;

            document.getElementById("reviewBlock").innerHTML = formatted_review;
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
                <br />
                <h1 id="bookDetailsHead">Book Review</h1>
                <br />
                <input type="hidden" id="id1" runat="server"></input>
            </div>
            <!--Div contains reviews for the book-->
            <div id="reviewBlock">
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
