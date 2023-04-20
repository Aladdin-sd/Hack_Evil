<?php
 $video = file_get_contents('php://input');
 $filename = '/storage/emulated/0/video_' . date('YmdHis') . '.mp4';
 file_put_contents($filename, $video);
 echo "تم حفظ الفيديو بنجاح في الملف " . $filename;
?>
