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
    <title>BookHaven</title>
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <link rel="icon" type="image/png" href="../images/book-icon1.jpg" />
    <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript">
        var formatteddata = '';
        var b_id, b_image;

        // Getting hidden key, Passing it as param
        function onload() {
            var grkey = $('#id1').val();
            var param = {
                "author_id": "<%= Request.Params["aid"] %>",
                "key": grkey
            };
            // param is passed to handler, where URL is constrcuted and response is done.
            $.ajax({
                type: "POST",
                url: "AuthorBooksHandler.ashx",
                data: param,
                success: extractBookId,
                error: function (xhr, status, err) {
                    document.getElementById('authorBooksDisplay').innerHTML = '<br/><center><h2>The API is not responding right now..Please try again later..</h2></center>';
                }
            });

        }
        //Extracting the required data from XML data.
        function extractBookId(xmldata) {

            formatteddata += '<center><h1>Author Books</h1><br/><br/><div id="relatedBooks"><br/><br/>';
            var b_title;
            $(xmldata).find('book').each(function () {
                b_id = $(this).find('id').first().text();
                b_image = $(this).find('image_url').first().text();
                b_title = $(this).find('title').first().text();

                formatteddata += '<a href="sim_book_details.aspx?bid=' + b_id + '" target="_blank">';
                formatteddata += '<img src="' + b_image + '" id="authBooksImages" alt="' + b_title + '" title="' + b_title + '"/></a>';
            });
            formatteddata += '</div></center>';
            document.getElementById('authorBooksDisplay').innerHTML = formatteddata;

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

            <br />

            <br />
            <!-- Hidden Input field for storing key and hiding it from User -->
            <input type="hidden" id="id1" runat="server"></input>
            <!-- Div Container for loading Author Books -->
            <div id="authorBooksDisplay">
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
