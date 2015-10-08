<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>BOOKHAVEN</title>

    <link rel="stylesheet" href="css/style.css">


    <script>

        expireDate = new Date
        expireDate.setMonth(expireDate.getMonth() + 6)
        jcount = eval(cookieVal("Counter"))
        jcount++
        document.cookie = "Counter=" + jcount + ";expires=" + expireDate.toGMTString()

        //Returns the values of Cookie, which can be in turn used for calculating count.
        function cookieVal(cookieName) {
            thisCookie = document.cookie.split("; ")
            for (i = 0; i < thisCookie.length; i++) {
                if (cookieName == thisCookie[i].split("=")[0]) {
                    return thisCookie[i].split("=")[1]
                }
            }
            return 0
        }

        //Calucalting Page Counter using Cookies
        function page_counter() {
            for (i = 0; i < (7 - jcount.toString().length) ; i++)
                document.write('<span class="counter">0</span>')
            for (y = 0; y < (jcount.toString().length) ; y++)
                document.write('<span class="counter">' + jcount.toString().charAt(y) + '</span>')
        }

    </script>

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

    <center>
<div class="content">
  <div class="article">
    <p>
	Welcome to BookHaven.
    </p>
      <br/>
      <br/>

      <p2>Quote for Day</p2>
      <form name="quoteForm">
          <!-- Area for the quotes -->
  <textarea wrap="virtual" name="quoteHere" Rows=4 Cols=60>
    
  </textarea><br>
  <input type=button id=btn1 value="Previous" onClick="prevQuote();">
  <input type=button id=btn1 value="Next" onClick="nextQuote();">
  <input type=button id=btn1 value="Random" onclick="randQuote();">
</form>

      <br>
      <br>
      You have visited this page 
<SCRIPT>
    page_counter(jcount);
</SCRIPT>
 times.
  </div>
    <div class="footer_div">
            <footer>
                Data courtesy: GoodReads, NYT, and Google
                <br />
                &copy; 2015 K.Akhil. All rights reserved.
            </footer>
        </div>
</div>
    </center>


    <script language="Javascript" src="js/ultrandom.js">

    </script>





</body>

</html>
