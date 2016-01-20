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
        'custom'        => BASE_AVATAR,
    ),
    array(
        'var'           => 'base_logo_use',
        'name'          => BASE_LOGO_USE,
        'type'          => 'boolean',
        'default'       => 'false',
    ),
    array(
        'var'           => 'base_logo_img',
        'name'          => BASE_LOGO_IMG,
        'type'          => 'media',
        'default'       => serendipity_getTemplateFile('logo.png')
    ),
    array(
        'var'           => 'base_logo_topspace',
        'name'          => BASE_LOGO_TOP,
        'type'          => 'string',
        'default'       => '0',
    ),
    array(
        'var'           => 'base_logo_leftspace',
        'name'          => BASE_LOGO_LEFT,
        'type'          => 'string',
        'default'       => '0',
    ),
    array(
        'var'           => 'feedburner',
        'name'          => BASE_FEEDBURNER,
        'type'          => 'string',
        'default'       => '',
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
