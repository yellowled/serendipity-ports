    <head>
        <title>{$CONST.SERENDIPITY_ADMIN_SUITE}</title>
        <meta http-equiv="Content-Type" content="text/html; charset={$head_charset}" />
        <meta name="Powered-By" content="Serendipity v.{$head_version}" />
        <link rel="stylesheet" type="text/css" href="{$head_link_stylesheet}" />
        <script type="text/javascript">
           window.onload = function() {ldelim}
             parent.document.getElementById('serendipity_iframe').style.height = document.getElementById('post').offsetHeight
                                                                               + parseInt(document.getElementById('post').style.marginTop)
                                                                               + parseInt(document.getElementById('post').style.marginBottom)
                                                                               + 'px';
             parent.document.getElementById('serendipity_iframe').scrolling    = 'no';
             parent.document.getElementById('serendipity_iframe').style.border = 0;
           {rdelim}
        </script>
    </head>

    <body style="padding: 0px; margin: 0px;">
        <div id="page" style="padding: 0; margin: 5px auto; width: 98%;">
            <div id="content style="padding: 0; margin: 5px auto; width: 98%;"">
            {$preview}
            </div>
        </div>
    </body>
