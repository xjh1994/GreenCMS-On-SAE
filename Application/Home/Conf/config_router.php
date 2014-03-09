<?php
$config_router = array(

    'URL_HTML_SUFFIX' => 'html',
    //URL模式
    'URL_MODEL'       => 2,
    //开启路由!!建议url模型选择2，否则的话建议使用native模式

    'URL_ROUTER_ON'   => false,
    //路由定义
    'URL_ROUTE_RULES' => array(
        'Post/single/:year/:month/:day/:info' => 'Post/single', //年月日规则路由
        'Post/single/:year/:month/:info'      => 'Post/single', //年月规则路由
        'Post/single/:year/:info'             => 'Post/single', //年规则路由
        'Post/single/:info'                   => 'Post/single', //普通规则路由

        'Post/page/:year/:month/:day/:info'   => 'Post/page', //年月日规则路由
        'Post/page/:year/:month/:info'        => 'Post/page', //年月规则路由
        'Post/page/:year/:info'               => 'Post/page', //年规则路由
        'Post/page/:info'                     => 'Post/page', //普通规则路由

        'Tag/:info'                           => 'Tag/detail', //普通规则路由

        'Cat/:father1/:father2/:info'         => 'Cat/detail', //普通规则路由
        'Cat/:father/:info'                   => 'Cat/detail', //普通规则路由
        'Cat/:info'                           => 'Cat/detail', //普通规则路由jius
    ),

    /**
     * 注意！顺序不能乱 只有不符合第一个条件才回去匹配第二个
     */
    /**
     * @var
     * native,
     * post_id,
     * post_name,
     * year/month/day/post_name,
     * year/month/day/post_id,
     * year/month/post_name,
     * year/month/post_id,
     * year/post_name,
     * year/post_id,
     * */
    'OUR_URL_MODEL'   => "native", //Single单页路由模式


    /**
     * @var
     * native
     * ID
     * slug
     */
    //TODO 当前只有native模式可以使用
    'OUR_TAG_MODEL'   => "native", //TAG标签路由模式.


    /**
     * @var
     * native
     * ID
     * slug
     */
    //TODO 当前只有native模式可以使用
    'OUR_CAT_MODEL'   => "native", //TAG标签路由模式.


);

return $config_router;
