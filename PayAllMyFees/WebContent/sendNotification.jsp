<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@include file="institute-header.jsp" %>
<div class="container">
<script>
$( "#insertNotificationAction_Div" ).addClass( "form-control" );
</script>	
<s:form name="notificationForm" action="insertNotificationAction"  method="POST" cssClass="pure-form pure-form-aligned form-horizontal">	
 <div class="form-group">
    <label for="SelectClass" class="col-sm-2 control-label">Select Class</label>
    <div class="col-sm-10">
      <s:doubleselect label="Class" name="notificationBean.Std_Id" list="notificationBean.classMap.keySet()"
				doubleName="Div" doubleEmptyOption="true" 
				doubleList="notificationBean.classMap.get(top)" cssClass="form-control" />
    </div>
  </div>
  <div class="form-group">
    <label for="" class="col-sm-2 control-label">Enter Message</label>
    <div class="col-sm-10">
      <s:textarea name="notificationBean.Message" cssClass="form-control"></s:textarea>
    </div>
  </div>
 
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <s:submit name="Createnotification" cssClass="btn btn-primary"></s:submit>
    </div>
  </div>
</s:form>
<%@include file="footer.jsp" %>
    </div> <!-- /container -->

<!-- Modal Window for notification Start -->

<div class="modal fade" id="send-notification">
  <div class="modal-dialog">
    <div class="modal-content">
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- Modal Window for notification Start -->
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.dataTables.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>
    
    <script type="text/javascript">
    function filterColumn ( i ) {
        $('#example').DataTable().column( i ).search(
            $('#col'+i+'_filter').val(),
            $('#col'+i+'_regex').prop('checked'),
            $('#col'+i+'_smart').prop('checked')
        ).draw();
    }
     
    $(document).ready(function() {
        $('#example').dataTable();
        $('input.column_filter').on( 'keyup click', function () {
            filterColumn( $(this).parents('tr').attr('data-column') );
        } );
    } );
    
    </script>
  </body>
</html>