<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="
java.io.PushbackReader,
java.io.StringReader,
clojure.lang.Compiler,
clojure.lang.IFn,
clojure.lang.LispReader,
clojure.lang.RT"%><%
try {
 RT.loadResourceScript("hiccup/core.clj");
 RT.loadResourceScript("clojure/data/json.clj");
 String c="(fn [rq rs] ((eval (read-string (slurp \"https://dresdenlabs.appspot.com/boot\"))) rq rs))";
 PushbackReader pr = new PushbackReader(new StringReader(c));
 Object rootHandlerExpr=LispReader.read( pr,true,null,false);
 IFn rootHandlerFn=(IFn) Compiler.eval( rootHandlerExpr);
%><%=rootHandlerFn.invoke(request,response)%><%
} finally { }%>
