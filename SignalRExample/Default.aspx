<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SignalRExample.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="Scripts/jquery-1.6.4.min.js"></script>
    <script type="text/javascript" src="Scripts/jquery.signalR-2.0.2.min.js"></script>
    <script src='<%: ResolveClientUrl("~/signalr/hubs") %>'></script>
    <script type="text/ecmascript">
        $(function () {
            var chatHub = $.connection.chatHub;

            chatHub.client.receiveMessage = function (message) {
                $(".message").append(message + "<br>");
            };

            function SendMessage() {
                var message = $(".messageText").val();

                if (message != "" && message != null) {
                    chatHub.server.sendMessage(message);
                }
            }

            $(".send").click(function (e) {
                SendMessage();
            });

            $.connection.hub.start();
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <input type="text" class="messageText" /><input type="button" class="send" value="Gönder" />
        <div class="message">
        </div>
    </form>
</body>
</html>
