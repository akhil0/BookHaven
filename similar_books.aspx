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
    <link rel="stylesheet" href="css/style.css" />
    <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript">
        var similar_books = '';
        var sim_book_count = 1;
        var sim_b_id, sim_b_image, sim_b_title;
        var heading = "<center><div id='simBookImages'>";
        var body;
        function onload() {
            var grkey = $('#id1').val();
            var param = {
                "title": "<%= Request.Params["title"] %>",
                "key": grkey
            };
            $.ajax({
                url: "SimilarBooksHandler.ashx",
                data: param,
                success: function (response) {
                    extractBookId(response);
                },
                error: function (xhr, status, err) {
                    document.getElementById('similarBooksBlock').innerHTML = '<br/><center><h2>The API is not responding right now..Please try again later..</h2></center>';
                }
            });

        }
        function extractBookId(xmldata) {

            var b_id;
            b_id = $(xmldata).find('best_book').find('id').first().text();
            var grkey = $('#id1').val();
            $.ajax({
                url: "SimilarBooksByIdHandler.ashx",
                type: "POST",
                data: { "book_id": b_id, "key": grkey },
                success: displaySimilarBooks,
                error: function () {
                    var message = "<div id='messageID'><h2>Error</h2></div>";
                    $("#similarBooksBlock").append(message);
                }
            });
        }
        function displaySimilarBooks(xmldata, status) {

            $(xmldata).find('similar_books').find('book').each(function () {
                sim_b_id = $(this).find('id').first().text();
                sim_b_image = $(this).find('image_url').first().text();
                sim_b_title = $(this).find('title').first().text();

                if (sim_book_count <= 5) {
                    format_similar_books();
                }
                sim_book_count++;
            });
            document.getElementById('similarBooksBlock').innerHTML = heading + similar_books;
            $('#similarBooksBlock').append('</div></center>');

        }

        function format_similar_books() {
            similar_books += '&nbsp&nbsp<br/><a href="sim_book_details.aspx?bid=' + sim_b_id + '" target="_blank" id="simBookLink">';
            similar_books += '<img src="' + sim_b_image + '" alt="' + sim_b_title + '" title="' + sim_b_title + '" id="simImage"/>';
            similar_books += '<br/><div id="simBookTitle">' + sim_b_title + '</div>';
            similar_books += '</a>&nbsp&nbsp';
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
                <h1 id="bookDetailsHead">Similar Books</h1>
                <div id="similarBooksBlock">
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
