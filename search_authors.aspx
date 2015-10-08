<%@ Page Language="C#" %>

<%@ Import Namespace="edu.neu.ccis.rasala" %>

<!DOCTYPE html>
<html>

<head>
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

    <meta charset="UTF-8">

    <title>BOOKHAVEN</title>

    <link rel="stylesheet" href="css/style.css">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>

    <script src="js/author.js"></script>

</head>

<body id="authorbg">

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
                <h1 id="athrSrchHead">Find any Author</h1>
                <br />
                <div id="line1">Please enter full name of the author you want to search.</div>
                <br />
                <center>
                    <input type="hidden" id="id1" runat="server"></input>
                <input type="text" id="searchTextbox" placeholder="eg. Rowling" size="35"/>
                <button type="button" id="search_button">Search</button>
                    </center>
            </div>
            <!--Div returns search results-->
            <div id="searchAuthorResults">
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
