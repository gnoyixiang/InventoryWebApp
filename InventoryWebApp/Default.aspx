<!DOCTYPE html>

<html>
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    <!-- Bootstrap CSS CDN -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <!-- Our Custom CSS -->
    <link rel="stylesheet" href="/Content/custom2.css">
    <!-- FontsAwesome -->
    <link rel="stylesheet" href="/Content/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/Content/font-awesome-4.7.0/css/font-awesome.css">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <style>
        body {
            background: linear-gradient(to bottom, #253161, #3852bdcc);
            min-height:100vh;
            color:#fff;

        }
        .logo{
            text-align:center;
            padding-top:30vh;
        }
        .body-row{
            min-height:100vh;
            min-width:100%;
        }        
        .fillheight{
            min-height:100vh;
        }
        

        .ml12 {
  font-weight: 700;
  font-size: 1.8em;
  text-transform: uppercase;
  letter-spacing: 0.5em;
}

.ml12 .letter {
  display: inline-block;
  line-height: 1em;
}
    </style>
</head>
<body>
    <div class="body-row">
        <div class="col-md-12 logo fillheight">
            <div>
                <i class="fa fa-cubes fa-5x" aria-hidden="true"></i>
                <br />
                <br />
                <h2 class="ml12">Stationery Store                         
                </h2>
                <h2 class="ml12">Inventory System                         
                </h2>                
            </div>
            <div style="padding-top:100px;">
                <a href="/Account/Login" class="btn btn-default" style="background-color: transparent;color: #fff;border-width: 2px;">Login</a>
            </div>
        </div>
    </div>
    <!-- jQuery CDN -->
    <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
    <!-- Bootstrap Js CDN -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <!-- Moving Letters -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/animejs/2.0.2/anime.min.js"></script>

    <script>
        // Wrap every letter in a span
        $('.ml12').each(function () {
            $(this).html($(this).text().replace(/([^\x00-\x80]|\w)/g, "<span class='letter'>$&</span>"));
        });

        anime.timeline({ loop: true })
          .add({
              targets: '.ml12 .letter',
              translateX: [40, 0],
              translateZ: 0,
              opacity: [0, 1],
              easing: "easeOutExpo",
              duration: 1200,
              delay: function (el, i) {
                  return 500 + 30 * i;
              }
          }).add({
              targets: '.ml12 .letter',
              translateX: [0, -30],
              opacity: [1, 0],
              easing: "easeInExpo",
              duration: 1100,
              delay: function (el, i) {
                  return 100 + 30 * i;
              }
          });
    </script>


</body>
</html>