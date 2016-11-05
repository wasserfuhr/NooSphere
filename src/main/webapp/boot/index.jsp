<%@page import="
java.io.PushbackReader,
java.io.StringReader,
clojure.lang.Compiler,
clojure.lang.IFn,
clojure.lang.LispReader,
clojure.lang.RT"%><%try{
 RT.loadResourceScript("hiccup/core.clj");
 RT.loadResourceScript("clojure/data/json.clj");
 String c="(fn[rq rs]((eval(read-string(slurp \"H:/git/NooSphere/init.clj\"))) rq rs))";
 PushbackReader pr=new PushbackReader(new StringReader(c));
 Object expr=LispReader.read(pr,true,null,false);
 IFn rhFn=(IFn)Compiler.eval(expr);
%><%=rhFn.invoke(request,response)%><%}finally{}%>
