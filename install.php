<?php
/**
 * Created by Green Studio.
 * File: admin.php
 * User: TianShuo
 * Date: 14-1-23
 * Time: 上午11:57
 */
if (version_compare(PHP_VERSION, '5.3.0', '<')) die('require PHP > 5.3.0 !'); //这个是TP3.2的需求,需要namespace

header("Location: ./index.php?m=Install");