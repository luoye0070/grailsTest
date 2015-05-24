<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 15-3-23
  Time: 下午9:39
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title>kindEditor</title>
    <script type="text/javascript" src="${resource(dir:"js/kindeditor-4.1.10", file:"kindeditor-all-min.js")}"></script>
    <script type="text/javascript" src="${resource(dir:"js/kindeditor-4.1.10/lang", file:"zh_CN.js")}"></script>
    <script type="text/javascript">
    KindEditor.ready(function(K) {
    window.editor = K.create('#editor_id');
    });
</script>

    </head>
<body>
<form method="POST">
<textarea id="editor_id" name="content" style="width:700px;height:300px;">
    ${htmlStr}
</textarea>
    <input type="submit" value="submit"/>
</form>

${htmlStr}
</body>
</html>