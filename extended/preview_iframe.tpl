    <head>
        <title>{$CONST.SERENDIPITY_ADMIN_SUITE}</title>
        <meta http-equiv="Content-Type" content="text/html; charset={$head_charset}" />
        <meta name="Powered-By" content="Serendipity v.{$head_version}" />
        <link rel="stylesheet" type="text/css" href="{$head_link_stylesheet}" />
        <link rel="stylesheet" type="text/css" href="{serendipity_getFile file="s9y.css"}" />
        <script type="text/javascript">
           window.onload = function() {ldelim}
             parent.document.getElementById('serendipity_iframe').style.height = document.getElementById('post').offsetHeight
                                                                               + parseInt(document.getElementById('postt').style.marginTop)
                                                                               + parseInt(document.getElementById('post').style.marginBottom)
                                                                               + 'px';
             parent.document.getElementById('serendipity_iframe').scrolling    = 'no';
             parent.document.getElementById('serendipity_iframe').style.border = 0;
           {rdelim}
        </script>
    </head>

    <body style="background: #fff;">
    <div id="content" style="background: #fff; float: none; width: 98%; padding: 0!important; margin: 0;">
        {$preview}
    </div>
    </body>
