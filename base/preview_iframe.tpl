    <head>
        <title>{$CONST.SERENDIPITY_ADMIN_SUITE}</title>
        <meta http-equiv="Content-Type" content="text/html; charset={$head_charset}" />
        <meta name="Powered-By" content="Serendipity v.{$head_version}" />
        <link rel="stylesheet" type="text/css" href="{serendipity_getFile file="960gs/960.css"}" />
        <link rel="stylesheet" type="text/css" href="{$head_link_stylesheet}" />
        <link rel="stylesheet" type="text/css" href="{serendipity_getFile file="s9y.css"}" />
<!--[if lte IE 6]>
        <script defer type="text/javascript" src="{$serendipityHTTPPath}templates/{$template}/js/pngfix.js"></script>
<![endif]-->
        <script type="text/javascript">
           window.onload = function() {ldelim}
             parent.document.getElementById('serendipity_iframe').style.height = document.getElementById('iframed').offsetHeight
                                                                               + parseInt(document.getElementById('iframed').style.marginTop)
                                                                               + parseInt(document.getElementById('iframed').style.marginBottom)
                                                                               + 'px';
             parent.document.getElementById('serendipity_iframe').scrolling    = 'no';
             parent.document.getElementById('serendipity_iframe').style.border = 0;
           {rdelim}
        </script>
    </head>

    <body>
        <div id="iframed" class="container_12" style="margin: 5px auto 5px auto; width: 98%;">
            <div id="main" class="clearfix">
                <div id="content" class="grid_7">{$preview}</div>
            </div>
        </div>
    </body>
