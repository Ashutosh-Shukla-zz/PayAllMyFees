<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<div class="clear"></div>
<div class="footer pmf_txt_center">
	<ul class="footer_info_nav">
		<li><a href="#">Careers</a></li>
		<li><a href="#">Partner With Us</a></li>
		<li><a href="#">Terms &amp; Conditions</a></li>
		<li><a href="#">Privacy Policy</a></li>

	</ul>
	<div class="pmf_footer_copyright pmf_txt_center">Copyright &copy; 2014 Samay Macro Solutions Pvt Ltd</div>
</div>

<script type="text/javascript">
	var a = 0;
	a = document.documentElement.clientWidth;
	if (a >= 480) {
		//document.getElementById("mobile_tab").style.display = "none";
		//document.getElementById("desktop_login_tab").style.display = "block";

	} else {
		//document.getElementById("desktop_login_tab").style.display = "none";
		//document.getElementById("mobile_tab").style.display = "block";
	}

	window.onresize = function() {
		var a = 0;
		a = document.documentElement.clientWidth;
		if (a >= 480) {
			//document.getElementById("mobile_tab").style.display = "none";
			//document.getElementById("desktop_login_tab").style.display = "block";

		} else {
			//document.getElementById("desktop_login_tab").style.display = "none";
			//document.getElementById("mobile_tab").style.display = "block";
		}
	};
</script>