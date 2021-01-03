<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="PAYMENTS_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<!--<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>-->
		<style>
			body, div, p, h1 { margin: 0; padding: 0; }
			body { font: 12px/1.7 "Open Sans"; color: #222; background-color: #fafafa; }
			#container { width: 400px; margin: 150px auto; }
			#header,
			#content { margin-bottom: 30px; }
			#header{ padding: 15px 0; }

			input { font-size: inherit; font-family: inherit; }
		</style>
		<link rel="stylesheet" href="../src/theme/jquery.timeselector.css" />
		<script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script>
		<script src="../src/jquery.timeselector.js"></script>
		<script>
			$(function() {
        $('[name="time"]').timeselector({ min: '09:00', max: '18:30' })
			});
		</script> 
    <script src="../time-picker-mouse-keyboard-interactions/Gruntfile.js"></script>
    <script src="../time-picker-mouse-keyboard-interactions/src/jquery.timeselector.js"></script>
    <link href="../time-picker-mouse-keyboard-interactions/src/theme/jquery.timeselector.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">
		<div id="container">
			<div id="content">
				<!--<input type="text" name="time" />-->
                 <asp:TextBox ID="time" runat="server" CssClass="DataEntryFormTableTextbox DataEntryFormTableTextboxWidth" ></asp:TextBox>
			</div>
		</div>
        </form>
	</body>
<script type="text/javascript">
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-36251023-1']);
  _gaq.push(['_setDomainName', 'jqueryscript.net']);
  _gaq.push(['_trackPageview']);
 (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
</html>

