<!DOCTYPE html>
<!-- 
	Author: Ning Li
	Date: Nov 07, 2020
	Description: This asp file used for client-side and server-side maximum number validation,
				 the client-side ensure the input is a number, the server-side ensure the input
				 is an integer and the value greater than 1.
-->

<html>
    <head>
        <title>Maximum number input for Hi-Lo game</title>
	    <style type="text/css">
        .style1 
        {
            text-align: center;
			color:Indigo
        }
		</style>	
		<script type="text/javascript">
		//
		// Function: validMaxInputs()
		// Purpose: To make sure the input is a number, also used for submitting the form data
		// Parameters: None 
		// Return: Nothing
		//
		
        function validMaxInputs ( )
        {	
            maxNum= document.getElementById("numPrompt").value;           
            numError.innerHTML="";                

            if (maxNum.trim().length == 0)	//if the input is blank
            {
                document.getElementById("numError").innerHTML = "The maximum guess number <b>cannot</b> be BLANK.";				
            }
            else if(isNaN(maxNum))       //if the inputting string is not a 'number'
            {
                document.getElementById("numError").innerHTML = "The maximum guess number <b>must</b> be a NUMBER.";				
            }
            else	// when the inputting is not blank and is a number then submit the form data
            {
                document.Form2.submit();
            }
        }		
		
		</script>
	</head>
	<body style="background-color:LightGray;">
	<H2 class="style1">Hi-Lo Game Maximum Number Input</H2>
	<%
	' hold the valid name value from hiloStart.html
	dim validName
	validName=Request.Form("namePrompt")
	' hold the maximum number inputed in this form
	dim maxNum	
	maxNum = Request.Form("numPrompt")
	if (validName = "") then
	validName=Session("name")
	else	
	Session("name")=validName
	end if
	' define a session to hold the maximum number value(will be used for next ASP page)
	Session("maxNum")=maxNum	
	%>
	
	<%
	' if the name is not blank and the maximum is blank, this means the first time this ASP page is used
	if (validName<>"" AND maxNum= "") then
	%>
		<br/><form name='Form2' action='maxNum.asp' method='post'>
		<table border='0'><tr>
		<td><b><%=validName%></b>, please enter an integer bigger than 1:&nbsp;&nbsp;</td>			 		       
		<td><input id='numPrompt' name='numPrompt' type='text'/>&nbsp;&nbsp;</td>
		<td><div id='numError' style='color:red;'></div></td>
		<tr><td></td><td><input type='button' id='maxNumValid' value='Submit' onclick='validMaxInputs();'></tr>					
		</tr></table>
		<input type="hidden" name="namePrompt" value=<%=validName%> />
		</form>			
	<%
	' when the inputting number is valid from the client-side, then execute the following code	 
	elseif (maxNum<>"") then
		' check the number whether a decimal, if it is decimal, then the form data go back to itself
		If (InStr(maxNum,".") >= 1) then
	%>
		<br/><form name='Form2' action='maxNum.asp' method='POST'>
		<table border='0'><tr>
		<td><b><%=validName%></b>, please enter an integer bigger than 1:&nbsp;&nbsp;</td>			 		       
		<td><input id='numPrompt' name='numPrompt' type='text'/>&nbsp;&nbsp;</td>
		<td><div id='numError' style='color:red;'>The maximum guess number <b>must</b> be INTEGER.</div></td>
		<tr><td></td><td><input type='button' id='maxNumValid' value='Submit' onclick='validMaxInputs();'></tr>					
		</tr></table>
		<input type="hidden" name="namePrompt" value=<%=validName%> />
		</form>
		<%
		' if the number less than 1, then the form data go back to itself
		elseif (CInt(maxNum)<=1) then
		%>
		<br/><form name='Form2' action='maxNum.asp' method='POST'>
		<table border='0'><tr>
		<td><b><%=validName%></b>, please enter an integer bigger than 1:&nbsp;&nbsp;</td>			 		       
		<td><input id='numPrompt' name='numPrompt' type='text'/>&nbsp;&nbsp;</td>
		<td><div id='numError' style='color:red;'>The maximum guess number <b>must</b> be greater than 1.</div></td>
		<tr><td></td><td><input type='button' id='maxNumValid' value='Submit' onclick='validMaxInputs();'></tr>					
		</tr></table>
		<input type="hidden" name="namePrompt" value=<%=validName%> />
		</form>

		<%			
		' if the number is an integer and greater than 1, go to the page "guessNum.asp" and with the valid data
		else Response.Redirect "gamePlay.asp"
		end if 
		%>	
	<%
	else
		response.write "Hey ... There is no name input!"		
	end if
	%>		
	</body>
<html>