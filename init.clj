(fn[rq rs](let[
  t(.getParameter rq"t")
  e(.getParameter rq"e")
  h(fn[m](let[; https://gist.github.com/kisom/1698245
   h(java.security.MessageDigest/getInstance"SHA-256")]
   (. h update m)(.digest h)))
   ;http://stackoverflow.com/questions/10062967/clojures-equivalent-to-pythons-encodehex-and-decodehex
  hh(fn[m](apply str(map #(format"%02x" %)m)))]
(if(.getParameter rq"e")((eval (read-string(slurp e)))rq rs)
 (if(=(.getParameter rq"a")"save")(do
  (spit(str"1220"(hh(h(.getBytes t)))".txt") t)
  (str"saved"(hh(h(.getBytes t)))))
(hiccup.core/html"<!DOCTYPE html>"[:html[:head[:title"/edit « ?"]][:body(slurp"https://dresdenlabs.appspot.com/at")
 [:form
  [:textarea{:name"t"}]
  [:input{:type"submit":name"a":value"save"}]]]]))))))
