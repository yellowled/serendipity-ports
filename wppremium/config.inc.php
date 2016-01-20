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
        'var'           => 'infoxxxwpp',
        'name'          => 'infoxxxwpp',
        'type'          => 'custom',
        'custom'        => WPP_INFO,
    ),
    array(
        'var'           => 'wppcolset',
        'name'          => WPP_COLSET,
        'type'          => 'select',
        'default'       => 'red',
        'select_values' => array(
                                 'red'   => WPP_COLSET_RED,
                                 'black' => WPP_COLSET_BLACK,
                                 'brown' => WPP_COLSET_BROWN)
    ),
    array(
        'var'           => 'wppfbemail',
        'name'          => WPP_FBEMAIL,
        'type'          => 'boolean',
        'default'       => 'false',
    ),
    array(
        'var'           => 'wppfburl',
        'name'          => WPP_FBURL,
        'type'          => 'string',
        'default'       => '',
    ),
    array(
        'var'           => 'wppfbid',
        'name'          => WPP_FBID,
        'type'          => 'string',
        'default'       => '',
    ),
    array(
        'var'           => 'wppdeftab',
        'name'          => WPP_DEFTAB,
        'type'          => 'select',
        'default'       => 'quicksearch',
        'select_values' => array(
                                 'quicksearch' => QUICKSEARCH,
                                 'archives'    => ARCHIVES,
                                 'categories'  => CATEGORIES)
    ),
    array(
        'var'           => 'wppadvertise',
        'name'          => WPP_ADVERTISE,
        'type'          => 'boolean',
        'default'       => 'false',
    ),
    array(
        'var'           => 'infoxxxads',
        'name'          => 'infoxxxads',
        'type'          => 'custom',
        'custom'        => WPP_AD_INFO,
    ),
    array(
        'var'           => 'wppaduri1',
        'name'          => WPP_ADURI_1,
        'type'          => 'string',
        'default'       => '#',
    ),
    array(
        'var'           => 'wppaduri2',
        'name'          => WPP_ADURI_2,
        'type'          => 'string',
        'default'       => '#',
    ),
    array(
        'var'           => 'wppaduri3',
        'name'          => WPP_ADURI_3,
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
