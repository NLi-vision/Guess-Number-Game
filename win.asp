<!DOCTYPE html>
<!-- 
	Author: Ning Li
	Date: Nov 07, 2020
	Description: This asp file used for showing "you win" and directing to a new page.
-->

<html>
    <head>
        <title>You win the Hi-Lo game</title>
	    <style type="text/css">
        .style1 
        {
			color:Indigo
        }
		</style>
	</head>
	<body style="background-color:YellowGreen;">
	<%
	dim playAgain
	' when first time this page is loaded, the session is not defined, so the playAgain value must be blank
	playAgain=Session("playAgain")
	%>
	<%
	' firstly define the playAgain session and load the HTML context
	if (playAgain="") then
		Session("playAgain")="yes"
	%>				
		<H2 class="style1">You Win!! You guessed the number!! </H2>
		<br/>	
		<form id='Form4' action='win.asp' method='post'>				
		<div id='button' style="text-indent:5%"><input type='submit' style="width:90px;height:30px" id='playAgain' value='Play Again'></div>							
		</form>
	<%
	' after the page was submitted to itself, the playAgain value is "yes", now we are going to leave this page,
	' before we leave, remove the value kept in playAgain session
	else
		Session.Contents.Remove("playAgain")
		Response.Redirect "maxNum.asp"
	end if
	%>			
	</body>
</html>