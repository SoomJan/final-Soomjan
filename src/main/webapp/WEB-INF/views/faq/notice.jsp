<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>Signin Template for Bootstrap</title>

    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link
      href="${ pageContext.servletContext.contextPath }/resources/css/main.css"
      rel="stylesheet"
    />
    <link href="css/glyphicons-halflings-regular.svg" rel="stylesheet" />

    <script src="css/ie-emulation-modes-warning.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript" src="css/bootstrap.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link
      href="${ pageContext.servletContext.contextPath }/resources/css/faq.css"
      rel="stylesheet"
    />

    <script
      type="text/javascript"
      src="//pagead2.googlesyndication.com/pagead/show_ads.js"
    ></script>
  </head>

  <!-- Channel Plugin Scripts -->
  <script>
    (function () {
      var w = window;
      if (w.ChannelIO) {
        return (window.console.error || window.console.log || function () {})(
          "ChannelIO script included twice."
        );
      }
      var ch = function () {
        ch.c(arguments);
      };
      ch.q = [];
      ch.c = function (args) {
        ch.q.push(args);
      };
      w.ChannelIO = ch;
      function l() {
        if (w.ChannelIOInitialized) {
          return;
        }
        w.ChannelIOInitialized = true;
        var s = document.createElement("script");
        s.type = "text/javascript";
        s.async = true;
        s.src = "https://cdn.channel.io/plugin/ch-plugin-web.js";
        s.charset = "UTF-8";
        var x = document.getElementsByTagName("script")[0];
        x.parentNode.insertBefore(s, x);
      }
      if (document.readyState === "complete") {
        l();
      } else if (window.attachEvent) {
        window.attachEvent("onload", l);
      } else {
        window.addEventListener("DOMContentLoaded", l, false);
        window.addEventListener("load", l, false);
      }
    })();
    ChannelIO("boot", {
      pluginKey: "b05edd24-961c-4a18-8d6f-1d8a717414b4",
    });
  </script>
  <!-- End Channel Plugin -->
  <body>
    <!-- <div class="background"></div> -->
    <jsp:include page="../common/nav.jsp" />

    <div class="faq-logo">
      <div class="test">
        <img
          src="${ pageContext.servletContext.contextPath }/resources/images/faq-logo2.jpg"
          alt="Logo2"
        />
      </div>
    </div>

    <main>
      <div class="faq-1">
        <h1>공지사항</h1>
        <hr style="border: 2px solid black" />
      </div>
    </main>

    <jsp:include page="../common/footer.jsp" />
  </body>
</html>
