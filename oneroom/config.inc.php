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
$serendipity['smarty']->assign(array('currpage2'=> $_SERVER['REQUEST_URI']));

$template_config = array(
    array(
        'var'           => 'infoxxx1',
        'name'          => 'infoxxx1',
        'type'          => 'custom',
        'custom'        => OR_INSTR_GENERAL,
    ),
    array(
        'var'           => 'showAdminNav',
        'name'          => OR_SHOW_ADMIN_NAV,
        'type'          => 'boolean',
        'default'       => 'true',
    ),
    array(
        'var'           => 'showRssAdd',
        'name'          => OR_SHOW_RSS_ADD,
        'type'          => 'boolean',
        'default'       => 'true',
    ),
    array(
        'var'           => 'showAboutBox',
        'name'          => OR_SHOW_ABOUT_BOX,
        'type'          => 'boolean',
        'default'       => 'true',
    ),
    array(
        'var'           => 'aboutimg',
        'name'          => OR_ABOUT_IMG,
        'type'          => 'media',
        'default'       => serendipity_getTemplateFile('about.jpg')
    ),
    array(
        'var'           => 'abouttxt',
        'name'          => OR_ABOUT_TXT,
        'type'          => 'text',
        'default'       => 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.',
    ),

    array(
        'var'           => 'showAdBox',
        'name'          => OR_SHOW_AD_BOX,
        'type'          => 'boolean',
        'default'       => 'true',
    ),
    array(
        'var'           => 'adnameleft',
        'name'          => OR_AD_NAME_LEFT,
        'type'          => 'string',
        'default'       => '',
    ),
    array(
        'var'           => 'adlinkleft',
        'name'          => OR_AD_LINK_LEFT,
        'type'          => 'string',
        'default'       => '',
    ),
    array(
        'var'           => 'adimgleft',
        'name'          => OR_AD_IMG_LEFT,
        'type'          => 'media',
        'default'       => serendipity_getTemplateFile('adleft.jpg')
    ),
    array(
        'var'           => 'adnameright',
        'name'          => OR_AD_NAME_RIGHT,
        'type'          => 'string',
        'default'       => '',
    ),
    array(
        'var'           => 'adlinkright',
        'name'          => OR_AD_LINK_RIGHT,
        'type'          => 'string',
        'default'       => '',
    ),
    array(
        'var'           => 'adimgright',
        'name'          => OR_AD_IMG_RIGHT,
        'type'          => 'media',
        'default'       => serendipity_getTemplateFile('adright.jpg')
    ),
    array(
        'var'           => 'amount',
        'name'          => NAVLINK_AMOUNT,
        'type'          => 'string',
        'default'       => '5',
    )
);

$template_loaded_config = serendipity_loadThemeOptions($template_config, $serendipity['smarty_vars']['template_option']);

if(isset($_POST['serendipity']['template']['amount']) && serendipity_userLoggedIn() && serendipity_checkPermission('adminTemplates')) {
  $temp_post=$_POST['serendipity']['template']['amount'];
  if(is_numeric($temp_post)) $template_loaded_config['amount'] =$temp_post;
}

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
