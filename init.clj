(fn[rq rs]
(if(=(.getParameter rq"a")"save")
 "saved"
(hiccup.core/html"<!DOCTYPE html>"[:html[:head
  [:title"BitCrush"]][:body(slurp"https://dresdenlabs.appspot.com/at")
[:form
[:textarea {:name"t"}]
[:input{:type"submit":name"a":value"save"}]]]]))))