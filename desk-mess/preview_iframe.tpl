    <head>
        <title>{$CONST.SERENDIPITY_ADMIN_SUITE}</title>
        <meta http-equiv="Content-Type" content="text/html; charset={$head_charset}" />
        <meta name="Powered-By" content="Serendipity v.{$head_version}" />
        <link rel="stylesheet" type="text/css" href="{$head_link_stylesheet}" media="screen" />
        <link rel="stylesheet" href="{serendipity_getFile file="s9y.css"}" type="text/css" media="screen" />
<!--[if IE 6]>
        <link rel="stylesheet" href="{serendipity_getFile file="ie60.css"}" type="text/css" media="screen" />
<![endif]-->
        <script type="text/javascript">
           window.onload = function() {ldelim}
             parent.document.getElementById('serendipity_iframe').style.height = document.getElementById('main-blog').offsetHeight
                                                                               + parseInt(document.getElementById('main-blog').style.marginTop)
                                                                               + parseInt(document.getElementById('main-blog').style.marginBottom)
                                                                               + 'px';
             parent.document.getElementById('serendipity_iframe').scrolling    = 'no';
             parent.document.getElementById('serendipity_iframe').style.border = 0;
           {rdelim}
        </script>
    </head>

    <body>
        <div id="mainwrap">
            <div id="wrapper" class="iframewrapper">
                <div id="content">
                    <div id="main-blog" style="padding: 5px; margin: 0px;">
                    {$preview}
                    </div>
                </div>
            </div>
        </div>
    </body>
