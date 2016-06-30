<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
<script type="text/javascript"
	src="//cdn.jsdelivr.net/jquery/1.11.2/jquery.min.js"></script>
<script src="sockjs-0.3.4.js"></script>
<script src="stomp.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var messageList = $("#messages");
		// defined a connection to a new socket endpoint
		var socket = new SockJS('/controller/stomp');
		var stompClient = Stomp.over(socket);
		stompClient.connect({}, function(frame) {
			// subscribe to the /topic/message endpoint
			stompClient.subscribe("/topic/message", function(data) {
				var message = data.body;
				messageList.append("<li>" + message + "</li>");
			});
		});
	});
</script>
</head>
<body>
	<h1>Hello world!</h1>

	<P>The time on the server is ${serverTime}.</P>

	<div>
		<h3>Messages:</h3>
		<ol id="messages"></ol>
	</div>
</body>
</html>
