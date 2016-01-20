<?php
if (IN_serendipity !== true) {
  die ("Don't hack!");
}

$probelang = dirname(__FILE__) . '/' . $serendipity['charset'] . 'lang_' . $serendipity['lang'] . '.inc.php';

if (file_exists($probelang)) {
    include $probelang;
}

include dirname(__FILE__) . '/lang_en.inc.php';

$serendipity['smarty']->assign(array('currpage'=> "http://".$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI']));

$template_config = array(
    array(
        'var'           => 'intro_left',
        'name'          => OL_INTROLEFT,
        'type'          => 'text',
        'default'       => 'Let the light pierce through the darkness. Close all old accounts, turn a new leaf. Re-learn that old lesson of friendship. Kill nor be killed, settle for lessening. Amidst us of this fossilized hatred.',
    ),
    array(
        'var'           => 'intro_right',
        'name'          => OL_INTRORIGHT,
        'type'          => 'text',
        'default'       => 'Perhaps that time has not come yet when our, Gods would listen to the beats in our hearts, peace and happiness spread their glow, perhaps we would have to force Mother Time?',
    ),
    array(
        'var'           => 'special',
        'name'          => OL_SPECIAL,
        'type'          => 'text',
        'default'       => 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi.',
    ),
    array(
        'var'           => 'contact',
        'name'          => OL_CONTACT,
        'type'          => 'string',
        'default'       => '#',
    ),
    array(
        'var'           => 'archive',
        'name'          => OL_ARCHIVE,
        'type'          => 'string',
        'default'       => '#',
    ),
    array(
        'var'           => 'amount',
        'name'          => NAVLINK_AMOUNT,
        'type'          => 'string',
        'default'       => '5',
    )
);

$template_loaded_config = serendipity_loadThemeOptions($template_config, $serendipity['smarty_vars']['template_option']);

$navlinks = array();

for ($i = 0; $i < $template_loaded_config['amount']; $i++) {
    $navlinks[] = array(
        'title' => $template_loaded_config['navlink' . $i . 'text'],
        'href'  => $template_loaded_config['navlink' . $i . 'url']
    );
    $template_config[] = array(
        'var'           => 'navlink' . $i . 'text',
        'name'          => NAV_LINK_TEXT . ' #' . $i,
        'type'          => 'string',
        'default'       => 'Link #' . $i,
        );
    $template_config[] = array(
        'var'           => 'navlink' . $i . 'url',
        'name'          => NAV_LINK_URL . ' #' . $i,
        'type'          => 'string',
        'default'       => '#',
    );
}

$serendipity['smarty']->assign_by_ref('navlinks', $navlinks);
