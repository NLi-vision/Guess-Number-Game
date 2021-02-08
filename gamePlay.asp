<!DOCTYPE html>
<!-- 
	Author: Ning Li
	Date: Nov 07, 2020
	Description: This asp file used for client-side and server-side guess number validation,
				 the client-side ensure the input is a number, the server-side handling the game
				 and make sure the guess number validation from business side.
-->

<html>
    <head>
        <title>Guess number input for Hi-Lo game</title>
	    <style type="text/css">
        .style1 
        {
            text-align: center;
			color:Indigo
        }
		</style>	
		<script type="text/javascript">
		//
		// Function: validGuessInputs()
		// Purpose: To make sure the input is a number, also used for submitting the form data
		// Parameters: None 
		// Return: Nothing
		//
		
        function validGuessInputs ( )
        {	
            guessNum= document.getElementById("guessNum").value;           
            numError.innerHTML="";                

            if ((guessNum.trim()).length == 0)	//if the input is blank
            {
                document.getElementById("numError").innerHTML = "The guess number <b>cannot</b> be BLANK.";				
            }
            else if(isNaN(guessNum))       //if the inputting string is not a 'number'
            {
                document.getElementById("numError").innerHTML = "The guess number <b>must</b> be a NUMBER.";				
            }
            else	// when the inputting is not blank and is a number then submit the form data
            {
                document.Form3.submit();
            }
        }		
		</script>
	</head>
	<body style="background-color:DarkSeaGreen;">
	<H2 class="style1">Hi-Lo Game Guess Number Input</H2>
	<%	
	dim maxNum, minRange, maxRange, guessNum, randomNum
	' get values from sessions
	maxNum=Session("maxNum") 
	minRange=CInt(Session("minRange"))
	maxRange=CInt(Session("maxRange"))
	' get guess value from this page's form
	guessNum = Request.Form("guessNum")
	
	if (guessNum="" and randomNum="") then
		Randomize
		randomNum = Int(((CInt(maxNum))-1+1)*Rnd+1)
		Session("randomNum")=randomNum
		Session("minRange")=1
		Session("maxRange")=CInt(maxNum)
	else
		randomNum=Session("randomNum")
	end if
	%>
	<%
	' if guess number is blank, absolutely, we load the page from here firstly
	if (guessNum="") then				
	%>	
		<br/><form name='Form3' action='gamePlay.asp' method='post'>
		<table border='0'><tr>
		<td>Your allowable guessing range is any value between 1 and <%=maxNum%>:&nbsp;&nbsp;</td>			 		       
		<td><input id='guessNum' name='guessNum' type='text'/>&nbsp;&nbsp;</td>
		<td><div id='numError' style='color:red;'></div></td></tr>
		<tr><td></td><td><input type='button' id='guessNumValid' value='Make this Guess' onclick='validGuessInputs();'></td>					
		</tr></table>
		</form>						
	<%
	' when the guess number is valid from the client-side, then execute the following code	 
	elseif (guessNum<>"") then
		' if the guess number is not an integer, then the form data is submitted to itself
		If (InStr(guessNum,".") >= 1) then
	%>
		<br/><form name='Form3' action='gamePlay.asp' method='POST'>
		<table border='0'><tr>
		<td>Your allowable guessing range is any value between 1 and <%=maxNum%>:&nbsp;&nbsp;</td>			 		       
		<td><input id='guessNum' name='guessNum' type='text'/>&nbsp;&nbsp;</td>
		<td><div id='numError' style='color:red;'>The guess number <b>must</b> be INTEGER.</div></td></tr>
		<tr><td></td><td><input type='button' id='guessNumValid' value='Make this Guess' onclick='validGuessInputs();'></td>					
		</tr></table>
		</form>
		<%
		' if the guess number less than 1, then the form data is submitted to itself
		elseif (CInt(guessNum)<1 or CInt(guessNum)>CInt(maxNum)) then
		%>
		<br/><form name='Form3' action='gamePlay.asp' method='POST'>
		<table border='0'><tr>
		<td>Your allowable guessing range is any value between 1 and <%=maxNum%>:&nbsp;&nbsp;</td>			 		       
		<td><input id='guessNum' name='guessNum' type='text'/>&nbsp;&nbsp;</td>
		<td><div id='numError' style='color:red;'>It is outside of the allowable range, the guessing range is any value between 1 and <%=maxNum%>.</div></td></tr>
		<tr><td></td><td><input type='button' id='guessNumValid' value='Make this Guess' onclick='validGuessInputs();'></td>					
		</tr></table>
		</form>	
		<%
		' if the guess number equal the random number, then go to the page "win.asp"
		elseif (CInt(guessNum)=randomNum) then
			Response.Redirect "win.asp"
		%>
		<%
		else
			' if the guess number less than the random number, we redefine the "minRange" session
			if (CInt(guessNum)<randomNum) then
			minRange=CInt(guessNum)+1
			Session("minRange")=minRange
		%>
			<br/><form name='Form3' action='gamePlay.asp' method='POST'>
			<table border='0'><tr>
			<td>Your allowable guessing range is any value between 1 and <%=maxNum%>:&nbsp;&nbsp;</td>			 		       
			<td><input id='guessNum' name='guessNum' type='text'/>&nbsp;&nbsp;</td>
			<td><div id='numError' style='color:red;'>Your allowable guessing range is any value between <%=CStr(minRange)%> and <%=CStr(maxRange)%>.</div></td></tr>
			<tr><td></td><td><input type='button' id='guessNumValid' value='Make this Guess' onclick='validGuessInputs();'></td>					
			</tr></table>
			</form>	
			<%
			' if the guess number greater than the random number, we redefine the "maxRange" session
			else
			maxRange=CInt(guessNum)-1
			Session("maxRange")=maxRange			
			%>
			<br/><form name='Form3' action='gamePlay.asp' method='POST'>
			<table border='0'><tr>
			<td>Your allowable guessing range is any value between 1 and <%=maxNum%>:&nbsp;&nbsp;</td>			 		       
			<td><input id='guessNum' name='guessNum' type='text'/>&nbsp;&nbsp;</td>
			<td><div id='numError' style='color:red;'>Your allowable guessing range is any value between <%=CStr(minRange)%> and <%=CStr(maxRange)%>.</div></td></tr>
			<tr><td></td><td><input type='button' id='guessNumValid' value='Make this Guess' onclick='validGuessInputs();'></td>					
			</tr></table>
			</form>							
			<%
			end if
			%>
		<%
		end if
		%>
	<%	
	end if
	%>
	</body>
</html>

		