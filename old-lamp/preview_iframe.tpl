    <head>
        <title>{$CONST.SERENDIPITY_ADMIN_SUITE}</title>
        <meta http-equiv="Content-Type" content="text/html; charset={$head_charset}" />
        <meta name="Powered-By" content="Serendipity v.{$head_version}" />
        <link rel="stylesheet" type="text/css" href="{$head_link_stylesheet}" />
        <link rel="stylesheet" type="text/css" href="{serendipity_getFile file="s9y.css"}" />
        <script type="text/javascript">
           window.onload = function() {ldelim}
             parent.document.getElementById('serendipity_iframe').style.height = document.getElementById('right').offsetHeight
                                                                               + parseInt(document.getElementById('right').style.marginTop)
                                                                               + parseInt(document.getElementById('right').style.marginBottom)
                                                                               + 'px';
             parent.document.getElementById('serendipity_iframe').scrolling    = 'no';
             parent.document.getElementById('serendipity_iframe').style.border = 0;
           {rdelim}
        </script>
    </head>

    <body style="padding: 0px; margin: 0px;">
        <div id="main" style="padding: 0px; margin: 0px; width: 98%!important;">
            <div id="right" style="padding: 0px; margin: 0px; width: 98%!important;">
                <div class="leftcol" style="padding: 0px; margin: 5px auto 5px auto; width: 98%!important;">
                {$preview}
                </div>
            </div>
        </div>
    </body>
