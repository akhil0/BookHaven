<%@ Page Language="C#" %>

<%@ Import Namespace="System" %>
<%@ Import Namespace="System.Data" %>
<!DOCTYPE html>

<script type="text/javascript">
   
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>BookHaven</title>
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <link rel="icon" type="image/png" href="../images/book-icon1.jpg" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
    <script type="text/javascript">
        function onload() {
            // only one book for details.
            var param = {
                q: "<%= Request.Params["id"] %>",
                 maxResults: "1"
            };
            // Calling AJAX for response data.
             $.ajax({
                 url: "https://www.googleapis.com/books/v1/volumes?",
                 data: param,
                 dataType: "jsonp",
                 success: function (response) {
                     format_data(response);
                 },
                 error: function (xhr, status, err) {
                     document.getElementById('bookDetails').innerHTML = '<br/><center><h2>The API is not responding right now..Please try again later..</h2></center>';
                 }
             });

        }
        // Format the JSON response data
         function format_data(JSONResponse) {
             console.log(JSONResponse);
             var tbody = "<div id='detailsBlock'>";

             tbody += "<br/>";
             var item = JSONResponse.items;
             // Only identified items are produced
             if (typeof item != 'undefined') {
                 var identifier = JSONResponse.items[0].volumeInfo.industryIdentifiers;
                 if (typeof identifier != 'undefined') {
                     var isbn = JSONResponse.items[0].volumeInfo.industryIdentifiers[0].identifier;
                     tbody += "ISBN:  " + isbn + "<br/>";
                 }
                 //  Title 
                 tbody += "<br/>";
                 var book_name = JSONResponse.items[0].volumeInfo.title;
                 tbody += book_name;

                 //Authors List, Looped for multiple values
                 var authorobj = JSONResponse.items[0].volumeInfo.authors;
                 if (typeof authorobj != 'undefined') {
                     tbody += "<br/><br/>";
                     var authors = "";
                     for (var j = 0; j < JSONResponse.items[0].volumeInfo.authors.length; j++) {
                         authors += JSONResponse.items[0].volumeInfo.authors[j];
                     }
                     tbody += "Author:  " + authors;
                 }

                 // Category of the book, Genre
                 var cat = JSONResponse.items[0].volumeInfo.categories;
                 if (cat != undefined) {
                     tbody += "<br/><br/>";
                     tbody += "Category:  " + cat + "<br/>";
                 }

                 // Description about the book. 
                 var desc = JSONResponse.items[0].volumeInfo.description;
                 if (desc != undefined) {
                     tbody += "<br/>";
                     tbody += "Summary:  " + desc + "<br/>";
                 }

                 //Publisher of the book, to cross check if book is valid
                 var pub = JSONResponse.items[0].volumeInfo.publisher;
                 if (pub != undefined) {
                     tbody += "<br/>";
                     tbody += "Publisher:  " + pub + "<br/>";
                 }

                 //Publishing Date
                 var pub_date = JSONResponse.items[0].volumeInfo.publishedDate;
                 if (pub_date != undefined) {
                     tbody += "<br/>";
                     tbody += "Publishing Year:  " + pub_date + "<br/>";
                 }

                 //Language of the Book
                 var lang = JSONResponse.items[0].volumeInfo.language;
                 if (lang != undefined) {
                     tbody += "<br/>";
                     tbody += "Language:  " + lang + "<br/>";
                 }

                 //Page count of the book.
                 var pgcount = JSONResponse.items[0].volumeInfo.pageCount;
                 if (pgcount != undefined) {
                     tbody += "<br/>";
                     tbody += "Page Count:  " + pgcount + "<br/>";
                 }

                 //Average Rating of the book
                 var avg_rating = JSONResponse.items[0].volumeInfo.averageRating;
                 if (avg_rating != undefined) {
                     tbody += "<br/>";
                     tbody += "Average Rating:  " + avg_rating + "<br/>";
                 }

                 //var access = JSONResponse.items[0].volumeInfo.accessInfo;
                 //if (access != undefined) {
                 //   var epub = JSONResponse.items[0].volumeInfo.accessInfo.epub;
                 //    if (epub != undefined && (JSONResponse.items[0].volumeInfo.accessInfo.epub.isAvailable === true)) {
                 //        var link = JSONResponse.items[0].volumeInfo.accessInfo.epub.acsTokenLink;
                 //    
                 //        var epublink = "<br/><a href= " + link + "'id='Dllink' target='_blank'>";
                 //         tbody += epublink + "Download EBook Sample</a></br>;
                 //    }
                 // }

                 // Retail Price of the book
                 var price = JSONResponse.items[0].saleInfo.retailPrice;
                 if (price != undefined) {
                     var amount = JSONResponse.items[0].saleInfo.retailPrice.amount;
                     var currency = JSONResponse.items[0].saleInfo.retailPrice.currencyCode;

                     tbody += "<br/>";
                     tbody += "Price:  " + amount + " " + currency + "<br/>";
                 }

                 // Preview Link of the book
                 var plink = JSONResponse.items[0].volumeInfo.previewLink;
                 if (plink != undefined) {

                     var elink = "<a href = " + plink + "'id='PreviewLink' target='_blank'>";
                     tbody += "<br/>";
                     tbody += elink + "Preview Link</a><br/>";
                 }


                 //Book Reviews
                 var book_review = "<br/><a href='book_reviews.aspx?title=" + book_name + "'id='reviewLink' target='_blank'>";
                 tbody += book_review + "Reviews for this book</a><br/><br/>";

                 //Similar Books to the current book, Pass the id.
                 var similar_books = "<a href='similar_books.aspx?title=" + book_name + "'id='simBooksLink' target='_blank'>";
                 tbody += similar_books + "Check out similar books</a><br/>";

                 tbody += "<br />";
                 tbody += "</div>";

                 //Image for the book
                 var imageobj = JSONResponse.items[0].volumeInfo.imageLinks;
                 if (typeof imageobj != 'undefined') {
                     var divImage = "<div id='imageDiv'>";
                     var thumbNail = JSONResponse.items[0].volumeInfo.imageLinks.thumbnail;
                     console.log(thumbNail);
                     var thumbNailProcessed = "<br/><br/><img src=" + thumbNail + " id='image'>";
                     divImage += thumbNailProcessed;
                     divImage += "</div>";
                 }
                 else {
                     var divImage = "<div id='imageDiv'>";
                     divImage += "<img src='../images/no_image.jpg' id='noImage'/></div>";
                 }
             }
             
             document.getElementById('bookDetails').innerHTML = divImage + tbody;
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
                <h1 id="bookDetailsHead">Book Details</h1>
            </div>
            <!--Book Details are shown in this Div-->
            <div id="bookDetails">
            </div>

        </div>
        <!--footer-->
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
