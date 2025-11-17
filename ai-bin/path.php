<?php
$regKey='HKEY_CURRENT_USER\Environment';
$cPath=@shell_exec('reg query '.$regKey.' /v path');
$bPath=preg_split('/\s+REG_SZ\s+/',$cPath);
$aPath=explode(';',$bPath[1]);
$zPath='C:\9r3i\ai\bin';
if(!in_array($zPath,$aPath)){
  $exec=@shell_exec('reg add '.$regKey.' /v PATH /f /t REG_SZ /d "'.$zPath.'"');
  echo $exec?'ok':'error';
}echo 'error';
