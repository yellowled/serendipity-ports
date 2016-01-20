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
        'var'           => 'infoxxx1',
        'name'          => 'infoxxx1',
        'type'          => 'custom',
        'custom'        => S03_README,
    ),
    array(
        'var'           => 's03_aboutme',
        'name'          => S03_ABOUTME,
        'type'          => 'radio',
        'default'       => 'true',
        'radio'         => array('value' => array('true', 'false'),
                                 'desc'  => array(YES, NO))
    ),
    array(
        'var'           => 's03_amtitle',
        'name'          => S03_ABOUTME_TITLE,
        'type'          => 'string',
        'default'       => 'About me',
    ),
    array(
        'var'           => 'infoxxx2',
        'name'          => 'infoxxx2',
        'type'          => 'custom',
        'custom'        => S03_ABOUTME_HINT,
    ),
    array(
        'var'           => 's03_amimg',
        'name'          => S03_ABOUTME_IMG,
        'type'          => 'media',
        'default'       => serendipity_getTemplateFile('image.gif')
    ),
    array(
        'var'           => 's03_amname',
        'name'          => S03_ABOUTME_NAME,
        'type'          => 'string',
        'default'       => 'Your name',
    ),
    array(
        'var'           => 's03_amshort',
        'name'          => S03_ABOUTME_SHORT,
        'type'          => 'string',
        'default'       => 'Your short info',
    ),
    array(
        'var'           => 's03_ammore',
        'name'          => S03_ABOUTME_MORE,
        'type'          => 'string',
        'default'       => 'More about me',
    ),
    array(
        'var'           => 's03_amuri',
        'name'          => S03_ABOUTME_URI,
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
