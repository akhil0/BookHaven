<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>BOOKHAVEN</title>

    <link rel="stylesheet" href="css/style.css">
</head>

<body>


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
                <h1 id="bookSrchHead">Search for book.. By Title</h1>
                <br>
                <center>
            <input type="text" id="textbox1" placeholder="eg. Harry Potter" size="35"/>
            <button type="button" id="search_button">Search</button>
            </center>
            </div>
            <br />
            <br />
            <div id="searchResults" class="results">
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

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>

    <script src="js/book.js"></script>


</body>

</html>
