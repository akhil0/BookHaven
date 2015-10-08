<%@ Page Language="C#" %>

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
            <br />
            <div id="bookDetailsHead">BestSellers by Genre</div>

            <div id="detailsBlock3">
                <ul id="bstsllrNav" style="list-style-type: none">
                    <li><a href="bestseller-booklist.aspx?term=combined-print-and-e-book-fiction" target="_blank" id="title1">Combined Print & E-book Fiction</a></li>
                    <li><a href="bestseller-booklist.aspx?term=hardcover-fiction" target="_blank" id="title2">Hardcover Fiction</a></li>
                    <li><a href="bestseller-booklist.aspx?term=hardcover-nonfiction" target="_blank" id="title3">Hardcover Non-Fiction</a></li>
                    <li><a href="bestseller-booklist.aspx?term=trade-fiction-paperback" target="_blank" id="title4">Trade Fiction Paperback</a></li>
                    <li><a href="bestseller-booklist.aspx?term=mass-market-paperback" target="_blank" id="title5">Mass Market Paperback</a></li>
                    <li><a href="bestseller-booklist.aspx?term=paperback-nonfiction" target="_blank" id="title6">Paperback Nonfiction</a></li>
                    <li><a href="bestseller-booklist.aspx?term=e-book-fiction" target="_blank" id="title7">E-Book Fiction</a></li>
                    <li><a href="bestseller-booklist.aspx?term=e-book-nonfiction" target="_blank" id="title8">E-Book Nonfiction</a></li>
                    <li><a href="bestseller-booklist.aspx?term=hardcover-advice" target="_blank" id="title9">Hardcover Advice</a></li>
                    <li><a href="bestseller-booklist.aspx?term=paperback-advice" target="_blank" id="title10">Paperback Advice</a></li>
                    <li><a href="bestseller-booklist.aspx?term=advice-how-to-and-miscellaneous" target="_blank" id="title11">Advice How-To and Miscellaneous</a></li>
                    <li><a href="bestseller-booklist.aspx?term=picture-books" target="_blank" id="title12">Picture Books</a></li>
                    <li><a href="bestseller-booklist.aspx?term=chapter-books" target="_blank" id="title13">Chapter Books</a></li>
                    <li><a href="bestseller-booklist.aspx?term=childrens-middle-grade" target="_blank" id="title14">Childrens Middle Grade</a></li>
                    <li><a href="bestseller-booklist.aspx?term=young-adult" target="_blank" id="title15">Young Adult</a></li>
                    <li><a href="bestseller-booklist.aspx?term=paperback-books" target="_blank" id="title16">Children's Paperback Books</a></li>
                    <li><a href="bestseller-booklist.aspx?term=series-books" target="_blank" id="title17">Series Books</a></li>
                    <li><a href="bestseller-booklist.aspx?term=hardcover-graphic-books" target="_blank" id="title18">Hardcover Graphic Books</a></li>
                    <li><a href="bestseller-booklist.aspx?term=paperback-graphic-books" target="_blank" id="title19">Paperback Graphic Books</a></li>
                    <li><a href="bestseller-booklist.aspx?term=manga" target="_blank" id="title20">Manga</a></li>
                    <li><a href="bestseller-booklist.aspx?term=combined-print-fiction" id="title21" target="_blank">Combined Print Fiction</a></li>
                    <li><a href="bestseller-booklist.aspx?term=combined-print-nonfiction" id="title22" target="_blank">Combined Print Nonfiction</a></li>
                    <li><a href="bestseller-booklist.aspx?term=animals" id="title23" target="_blank">Animals</a></li>
                    <li><a href="bestseller-booklist.aspx?term=business-books" id="title24" target="_blank">Business Books</a></li>
                    <li><a href="bestseller-booklist.aspx?term=celebrities" id="title25" target="_blank">Celebrities</a></li>
                    <li><a href="bestseller-booklist.aspx?term=crime-and-punishment" id="title26" target="_blank">Crime and Punishment</a></li>
                    <li><a href="bestseller-booklist.aspx?term=culture" id="title27" target="_blank">Culture</a></li>
                    <li><a href="bestseller-booklist.aspx?term=education" id="title28" target="_blank">Education</a></li>
                    <li><a href="bestseller-booklist.aspx?term=espionage" id="title29" target="_blank">Espionage</a></li>
                    <li><a href="bestseller-booklist.aspx?term=expeditions-disasters-and-adventures" id="title30" target="_blank">Expeditions Disasters and Adventures</a></li>
                    <li><a href="bestseller-booklist.aspx?term=family" id="title31" target="_blank">Family</a></li>
                    <li><a href="bestseller-booklist.aspx?term=fashion-manners-and-customs" id="title32" target="_blank">Fashion Manners and Customs</a></li>
                    <li><a href="bestseller-booklist.aspx?term=food-and-fitness" id="title33" target="_blank">Food and Fitness</a></li>
                    <li><a href="bestseller-booklist.aspx?term=games-and-activities" id="title34" target="_blank">Games and Activities</a></li>
                    <li><a href="bestseller-booklist.aspx?term=hardcover-business-books" id="title35" target="_blank">Hardcover Business Books</a></li>
                    <li><a href="bestseller-booklist.aspx?term=health" id="title36" target="_blank">Health</a></li>
                    <li><a href="bestseller-booklist.aspx?term=humor" id="title37" target="_blank">Humor</a></li>
                    <li><a href="bestseller-booklist.aspx?term=indigenous-americans" id="title38" target="_blank">Indigenous Americans</a></li>
                    <li><a href="bestseller-booklist.aspx?term=paperback-business-books" id="title39" target="_blank">Paperback Business Books</a></li>
                    <li><a href="bestseller-booklist.aspx?term=hardcover-political-books" id="title40" target="_blank">Hardcover Political Books</a></li>
                    <li><a href="bestseller-booklist.aspx?term=race-and-civil-rights" id="title41" target="_blank">Race and Civil Rights</a></li>
                    <li><a href="bestseller-booklist.aspx?term=relationships" id="title42" target="_blank">Relationships</a></li>
                    <li><a href="bestseller-booklist.aspx?term=religion-spirituality-and-faith" id="title43" target="_blank">Religion Spirituality and Faith</a></li>
                    <li><a href="bestseller-booklist.aspx?term=science" id="title44" target="_blank">Science</a></li>
                    <li><a href="bestseller-booklist.aspx?term=sports" id="title45" target="_blank">Sports</a></li>
                    <li><a href="bestseller-booklist.aspx?term=travel" id="title46" target="_blank">Travel</a></li>

                </ul>
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
